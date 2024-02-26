import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageResources.logo,width: 114,height: 114,),
        const Gap(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text.rich(
            TextSpan(
              text: 'login_to'.tr(),
              children: [
                TextSpan(
                    text: myLocale == 'en'?'safari'.tr():'restaurant'.tr(),
                    style: FontManager.getBoldStyle(fontSize: 26.37,).copyWith(letterSpacing: 2)
                ),
                TextSpan(
                  text: myLocale != 'en'?'safari'.tr():'restaurant'.tr(),
                ),
              ]
            ),
            textAlign: TextAlign.center,
            style: FontManager.getMediumStyle(fontSize: 26.37).copyWith(letterSpacing: 2),
          ),
        ),
      ],
    );
  }
}
