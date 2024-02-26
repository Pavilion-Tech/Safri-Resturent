import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    required this.onTouch,
    this.height = 60.55,
    this.radius = 11.64,
    this.width,
    this.color,
    this.textStyle,

});

  String text;
  VoidCallback onTouch;
  Color? color;
  TextStyle? textStyle;
  double height;
  double radius;
  double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
        onTouch();
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        height: height,width: width??size.width*.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(radius),
          color: color??ColorResources.kDefaultColor
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          text,
          style: textStyle??FontManager.getSemiBold(
              fontSize: 17.47,color: Colors.white),
        ),
      ),
    );
  }
}
