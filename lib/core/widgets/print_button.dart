import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class PrintButton extends StatelessWidget {
  PrintButton({
    required this.onTouch,
    required this.text
});

  String text;
  VoidCallback onTouch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(9.3),
        border: Border.all(color: ColorResources.black)
      ),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImageResources.print,width: 27.2,height: 27.2,),
          const Gap(6),
          Text(
            text,
            style: FontManager.getRegularStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
