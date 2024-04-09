import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/widgets/ui.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';

import '../../core/components/constants.dart';
import '../../core/network/remote/dio.dart';
import '../../core/network/remote/end_point.dart';
import '../../models/orders_model.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit () :super(AppInitState());
  static AppCubit get(context)=> BlocProvider.of(context);

  OrdersModel? ordersModel;

  ScrollController orderScrollController = ScrollController();

  int currentOrderType = 1;


  void changeOrderType(int index){
    currentOrderType = index;
    ordersModel = null;
    emit(ChangeOrderStatusState());
    getAllOrders();
  }

  void getAllOrders({int page = 1}){
    emit(OrdersLoadingState());
    DioHelper.getData(
      url: EndPoints.Orders,
      query: {"status":currentOrderType,"page":page},
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
        emit(OrdersSuccessState());
      }else{
        emit(OrdersErrorState());
      }
    }).catchError((e){
      emit(OrdersErrorState());
    });
  }

  void paginationOrders(){
    orderScrollController.addListener(() {
      if (orderScrollController.offset == orderScrollController.position.maxScrollExtent){
        if (ordersModel!.data!.currentPage != ordersModel!.data!.pages) {
          if(state is! OrdersLoadingState){
            int currentPage = ordersModel!.data!.currentPage! +1;
            getAllOrders(page: currentPage);
          }
        }
      }
    });
  }

  void changeOrderStatus(BuildContext context,
      {required String id,required int status,
        bool fromDetails = false, bool fromHome =true
      }){
    UIAlert.showLoading(context);
    emit(ChangeOrderStatusLoadingState());
    DioHelper.postData(
      url: EndPoints.ChangeOrderStatus,
      token: 'Bearer $token',
      data: {"order_id":id,"order_status":status}
    ).then((value) {
      if(value.data['data'] != null){
        emit(ChangeOrderStatusSuccessState());
        UIAlert.showAlert(context, message: value.data['message'],);
        Navigator.pop(context);
        if(fromDetails)Navigator.pop(context);
        if(fromHome)getAllOrders();
        else context.read<SettingsCubit>().getAllOrdersHistory();
      }else{
        emit(ChangeOrderStatusErrorState());
        UIAlert.showAlert(context,
            message: value.data['message']??'wrong'.tr(),
            type: MessageType.warning);
        Navigator.pop(context);
      }
    }).catchError((e){
      Navigator.pop(context);
      emit(ChangeOrderStatusErrorState());
      UIAlert.showAlert(context,
          message: 'wrong'.tr(),type: MessageType.error);
    });
  }
}