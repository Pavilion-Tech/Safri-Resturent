import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/features/home/home_page.dart';
import 'package:safari_restaurant/features/login/login_page.dart';

import '../../core/components/constants.dart';
import '../wrong_pages/maintenance_page.dart';
import '../wrong_pages/no_connection_page.dart';
import '../wrong_pages/update_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      navigateAndFinish(context, LoginPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.kDefaultColor,
      body: Center(
        child: Image.asset(ImageResources.splash,height: 240,width: 190,),
      ),
    );
  }
}
