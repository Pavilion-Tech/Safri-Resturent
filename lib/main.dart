import 'dart:io';
import 'dart:isolate';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/network/remote/dio.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'core/components/constants.dart';
import 'core/firebase_helper/firebase_options.dart';
import 'core/firebase_helper/notification_helper.dart';
import 'core/network/local/cache_helper.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/bloc_observer/bloc_observer.dart';
import 'features/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async{

  await WidgetsFlutterBinding.ensureInitialized();
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  Isolate.spawn(_isolateMain, rootIsolateToken);
  try{
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
    );
    NotificationHelper();
    await FirebaseMessaging.instance.requestPermission();
    fcmToken = await  FirebaseMessaging.instance.getToken();
    print("fcmToken");
    print(fcmToken);
  }catch(e){
    print(e.toString());
  }
  DioHelper.init();
  await CacheHelper.init();
  String? loca = CacheHelper.getData(key: 'locale');
  token = CacheHelper.getData(key:'token');
  print(token);//"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjU3MzRlZmZhNWFjYTg2NmI3ZDdhNjY5IiwiaXNfYnJhbmNoIjpmYWxzZSwicmVjZWl2aW5nX29yZGVyc19zdGF0dXMiOjEsImlzQWRtaW4iOmZhbHNlLCJ1c2VyX3R5cGUiOiJwcm92aWRlciIsImlhdCI6MTcwOTE0NTk3MH0.DZdPptEpHMdYbcuhqAbPYjau6VNKUy8XVLo_FnE6yiw"
  if(loca !=null){
    myLocale = loca;
  }else{
    Platform.localeName.contains('ar')
        ?myLocale = 'ar'
        :myLocale = 'en';
  }

  Bloc.observer = MyBlocObserver();

  runApp(EasyLocalization(

    supportedLocales: const [Locale('ar'),Locale('en')],

    useOnlyLangCode: true,

    path: 'assets/translations',

    fallbackLocale: const Locale('ar'),

    startLocale: Locale(myLocale),

    child: const MyApp(),

  ));

}

void _isolateMain(RootIsolateToken rootIsolateToken) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(sharedPreferences.getBool('isDebug'));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> AppCubit()..getAllOrders()),
        BlocProvider(create:(context)=> AuthCubit()),
        BlocProvider(create:(context)=> SettingsCubit()..init()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme:const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
          )
        ),
        home: SplashPage(),
      ),
    );
  }
}