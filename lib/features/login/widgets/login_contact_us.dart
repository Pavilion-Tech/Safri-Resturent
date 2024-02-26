import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class LoginContactUs extends StatelessWidget {
  const LoginContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141,width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(25),
        color: ColorResources.lightGrey.withOpacity(.3)
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginContactUsItem(
            image: ImageResources.whatsappIcon,
            title: 'whatsapp_us'.tr(),
            onTouch: (){
              whatAppContact();
            },
          ),
          const Gap(40),
          LoginContactUsItem(
            image: ImageResources.loginPhoneIcon,
            title: 'call_us'.tr(),
            onTouch: (){
              openUrl('tel://01223364710', context);
            },
          ),
        ],
      ),
    );
  }
}

class LoginContactUsItem extends StatelessWidget {
  LoginContactUsItem({
    required this.onTouch,
    required this.title,
    required this.image,
});
  
  String title;
  String image;
  VoidCallback onTouch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTouch,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image,width: 72.3,height: 72.3,),
          const Gap(12),
          Text(
            title,
            style: FontManager.getRegularStyle(fontSize: 12.5),
          )
        ],
      ),
    );
  }
}

