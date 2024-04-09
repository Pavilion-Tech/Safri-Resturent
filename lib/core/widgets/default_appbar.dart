import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class DefaultAppBar extends StatelessWidget {
  DefaultAppBar({required this.title,this.suffix});

  String title;
  Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: Transform.rotate(
                    angle: myLocale == 'en'?0:3.14,
                      child: Image.asset(ImageResources.arrowBack,width: 36.7,height: 36.7,))
              ),
              const Gap(12),
              Text(
                title,
                style: FontManager.getRegularStyle(fontSize: 17),
              )
            ],
          ),
          const Spacer(),
          if(suffix!=null)suffix!,
        ],
      ),
    );
  }
}
