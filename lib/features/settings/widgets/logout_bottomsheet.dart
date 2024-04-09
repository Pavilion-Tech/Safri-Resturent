import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/network/local/cache_helper.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/features/settings/widgets/settings_item.dart';
import 'package:safari_restaurant/features/splash/splash_page.dart';

import '../../../core/components/constants.dart';
import '../../../core/utils/font_manager.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20),
              color: Colors.white.withOpacity(.9)
          ),
          padding:const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'logout_hint'.tr(),
                style: FontManager.getMediumStyle(fontSize: 20),
              ),
              const Gap(15),
              CustomButton(
                  text: 'logout_now'.tr(),
                  onTouch: (){
                    token = null;
                    CacheHelper.removeData('token');
                    navigateAndFinish(context, SplashPage());
                  },
              ),
              TextButton(
                  onPressed: ()=>Navigator.pop(context),
                  child: Text(
                    'discard'.tr(),
                    style: FontManager.getMediumStyle(fontSize: 17),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

