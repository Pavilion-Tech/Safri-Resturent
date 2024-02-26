import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit () :super(AppInitState());
  static AppCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index){
    currentIndex = index;
    emit(ChangeOrderIndexState());
  }
}