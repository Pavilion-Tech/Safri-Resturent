import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

import '../../../core/components/components.dart';
import '../../settings/settings_page.dart';

class HomeAppBar extends StatefulWidget {
  HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {

  bool isOpen = true;

  void changeStatus(){
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration:const Duration(milliseconds: 500),
          transitionBuilder: (Widget child,Animation<double> animation){
            return ScaleTransition(scale: animation,child: child,);
          },
          child: InkWell(
            key: ValueKey(isOpen),
            onTap: ()=>changeStatus(),
            overlayColor: ColorResources.transparent,
            child: Image.asset(
              isOpen?ImageResources.open:ImageResources.close,
              width: 103,height: 37.6,
            ),
          ),
        ),
        const Spacer(),
        InkWell(
            onTap: ()=>navigateTo(context, SettingPage()),
            overlayColor: ColorResources.transparent,
            child: Image.asset(ImageResources.menuIcon,width: 54,height: 54,)
        )
      ],
    );
  }
}
