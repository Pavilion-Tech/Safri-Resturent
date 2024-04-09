import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:safari_restaurant/core/network/remote/dio.dart';
import 'package:safari_restaurant/core/network/remote/end_point.dart';
import 'package:safari_restaurant/models/restaurant_model.dart';
import 'package:safari_restaurant/models/settings_model.dart';

import '../../core/components/constants.dart';
import '../../core/widgets/ui.dart';
import '../../models/orders_model.dart';
import '../../models/static_pages_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context)=>BlocProvider.of(context);


  SettingsModel? settingsModel;

  StaticPagesModel? staticPagesModel;

  OrdersModel? ordersModel;

  RestaurantModel? restaurantModel;

  ScrollController orderScrollController = ScrollController();

  TextEditingController searchController = TextEditingController();

  bool showCalendar = false;

  void showingCalendar(){
    showCalendar = true;
    emitState();
  }

  void removeCalendar(){
    showCalendar = false;
    emitState();
  }

  void emitState()=>emit(EmitState());

  void init(){
    checkInterNet();
    getSettings();
    getStaticPages();
    getRestaurant();
  }

  void checkInterNet() async {
    InternetConnectionChecker().onStatusChange.listen((event) {
      final state = event == InternetConnectionStatus.connected;
      isConnect = state;
      emit(ConnectionState());
    });
  }

  void getSettings(){
    DioHelper.getData(
      url: EndPoints.Settings,
    ).then((value) {
      if(value.data['data']!=null){
        settingsModel = SettingsModel.fromJson(value.data);
        emit(GetSettingsSuccessState());
      }else{
        emit(GetSettingsErrorState());
      }
    }).catchError((e){
      emit(GetSettingsErrorState());
    });
  }

  void getStaticPages(){
    DioHelper.getData(
      url: EndPoints.StaticPages,
    ).then((value) {
      if(value.data['data']!=null){
        staticPagesModel = StaticPagesModel.fromJson(value.data);
        emit(GetStaticPagesSuccessState());
      }else{
        emit(GetStaticPagesErrorState());
      }
    }).catchError((e){
      emit(GetStaticPagesErrorState());
    });
  }

  void getAllOrdersHistory({int page = 1,String? fromDate,String? toDate}){
    emit(OrdersHistoryLoadingState());
    print(fromDate);
    DioHelper.getData(
      url: EndPoints.Orders,
      query: {
        "page":page,
        'search_text':searchController.text,
        if(fromDate!=null)"from_date":fromDate,
        if(toDate!=null)"to_date":toDate,

      },
      token: 'Bearer $token',
    ).then((value) {
      if(value.data['data']!=null){
        if(page == 1) {
          ordersModel = OrdersModel.fromJson(value.data);
        }
        else{
          ordersModel!.data!.currentPage = value.data['data']['currentPage'];
          ordersModel!.data!.pages = value.data['data']['pages'];
          value.data['data']['data'].forEach((e){
            ordersModel!.data!.data!.add(OrderData.fromJson(e));
          });
        }
        emit(OrdersHistorySuccessState());
      }else{
        emit(OrdersHistoryErrorState());
      }
    }).catchError((e){
      print(e.toString());
      emit(OrdersHistoryErrorState());
    });
  }

  void paginationOrdersHistory(){
    orderScrollController.addListener(() {
      if (orderScrollController.offset == orderScrollController.position.maxScrollExtent){
        if (ordersModel!.data!.currentPage != ordersModel!.data!.pages) {
          if(state is! OrdersHistoryLoadingState){
            int currentPage = ordersModel!.data!.currentPage! +1;
            getAllOrdersHistory(page: currentPage);
          }
        }
      }
    });
  }

  void getRestaurant(){
    emit(GetRestaurantLoadingState());
    DioHelper.getData(
      url: EndPoints.GetRestaurant,
      token: 'Bearer $token'
    ).then((value) {
      if(value.data['data']!=null){
        restaurantModel = RestaurantModel.fromJson(value.data);
        emit(GetRestaurantSuccessState());
      }else{
        emit(GetRestaurantErrorState());
      }
    }).catchError((e){
      emit(GetRestaurantErrorState());
    });
  }

  void changeCrowdedStatus(BuildContext context,
      {required int status,})
  {
    UIAlert.showLoading(context);
    emit(ChangeCrowdedStatusLoadingState());
    DioHelper.putData(
        url: EndPoints.ChangeCrowdedStatus,
        token: 'Bearer $token',
        data: {"crowded_status":status,}
    ).then((value) {
      if(value.data['data'] != null){
        getRestaurant();
        emit(ChangeCrowdedStatusSuccessState());
        UIAlert.showAlert(context, message: value.data['message'],);
        Navigator.pop(context);
      }else{
        emit(ChangeCrowdedStatusErrorState());
        UIAlert.showAlert(context,
            message: value.data['message']??'wrong'.tr(),
            type: MessageType.warning);
        Navigator.pop(context);
      }
    }).catchError((e){
      Navigator.pop(context);
      emit(ChangeCrowdedStatusErrorState());
      UIAlert.showAlert(context,
          message: 'wrong'.tr(),type: MessageType.error);
    });
  }
}
