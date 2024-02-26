import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';

import 'core/components/constants.dart';
import 'core/network/local/cache_helper.dart';
import 'cubits/bloc_observer/bloc_observer.dart';
import 'features/splash/splash_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String? loca = CacheHelper.getData(key: 'locale');
  if(loca !=null){
    myLocale = loca;
  }else{
    Platform.localeName.contains('ar')
        ?myLocale = 'ar'
        :myLocale = 'en';
  }

  BlocOverrides.runZoned(
        () =>  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'),Locale('en')],
      useOnlyLangCode: true,
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale(myLocale),
      child: const MyApp(),
    )),
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> AppCubit()),
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