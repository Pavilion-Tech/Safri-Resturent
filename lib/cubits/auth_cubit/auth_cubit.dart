import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/network/local/cache_helper.dart';
import 'package:safari_restaurant/core/network/remote/dio.dart';
import 'package:safari_restaurant/core/network/remote/end_point.dart';
import 'package:safari_restaurant/core/widgets/ui.dart';
import 'package:safari_restaurant/features/home/home_page.dart';
import 'package:safari_restaurant/models/settings_model.dart';

import '../../core/components/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context)=>BlocProvider.of(context);

  SettingsModel? settingsModel;

  void getSettings(){
    DioHelper.getData(
      url: EndPoints.Settings
    ).then((value) {
      if(value.data!=null){
        settingsModel = SettingsModel.fromJson(value.data);
        emit(SettingsSuccessState());
      }else{
        emit(SettingsErrorState());
      }
    }).catchError((e){
      emit(SettingsErrorState());

    });
  }

  void login({
    required BuildContext context,
    required String email,
    required String password,
}){
    UIAlert.showLoading(context);
    emit(LoginLoadingState());
    DioHelper.postData(
      url: EndPoints.Login,
      data: {"email":email,
        "password":password,
        "user_type":'provider',
        "firebase_token":fcmToken??'',
      }
    ).then((value) {
      if(value.data['data'] != null){
        token = value.data['data'];
        CacheHelper.saveData(key: 'token', value: token);
        UIAlert.showAlert(context,
            message:value.data['message']??'');
        emit(LoginSuccessState());
        Navigator.pop(context);
        navigateAndFinish(context, HomePage());
      }else{
        UIAlert.showAlert(context,
            message:value.data['message']??'wrong'.tr(),
            type: MessageType.warning);
        emit(LoginErrorState());
        Navigator.pop(context);
      }
    }).catchError((e){
      UIAlert.showAlert(context,message:'wrong'.tr(),type: MessageType.error);
      emit(LoginErrorState());
      Navigator.pop(context);
    });
  }
}
