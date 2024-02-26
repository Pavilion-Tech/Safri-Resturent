import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class WrongWidget extends StatelessWidget {
  WrongWidget({
    required this.title,
    required this.description,
    required this.image,
    this.button
});

  String image;
  String title;
  String description;
  Widget? button;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,width: 172,height: 202,),
          const Gap(30),
          Text(
            title.tr(),
            textAlign: TextAlign.center,
            style: FontManager.getMediumStyle(fontSize: 29),
          ),
          Text(
            description.tr(),
            textAlign: TextAlign.center,
            style: FontManager.getMediumStyle(fontSize: 14.5),
          ),
          const Gap(20),
          button??const SizedBox()
        ],
      ),
    );
  }
}
