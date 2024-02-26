import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/features/home/home_page.dart';
import 'package:safari_restaurant/features/settings/widgets/settings_item.dart';

import '../../../core/components/constants.dart';
import '../../../core/network/local/cache_helper.dart';
import '../../../core/utils/font_manager.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({Key? key}) : super(key: key);

  void changeLang(BuildContext context,String lang){
    myLocale = lang;
    context.setLocale(Locale(myLocale));
    CacheHelper.saveData(key: 'locale', value: myLocale);
    Navigator.pop(context);
    navigateAndFinish(context, HomePage());
  }

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
              LanguageItem(
                lang: 'arabic'.tr(),
                selected:myLocale == 'ar',
                onTouch: (){
                  changeLang(context,'ar');
                },
              ),
              const Gap(10),
              LanguageItem(
                lang: 'english'.tr(),
                selected: myLocale == 'en',
                onTouch: (){
                  changeLang(context,'en');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LanguageItem extends StatelessWidget {
  LanguageItem({
    required this.selected,
    required this.lang,
    required this.onTouch
});

  bool selected;
  String lang;
  VoidCallback onTouch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTouch,
      child: Container(
        height: 52,width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: selected?ColorResources.lightGrey.withOpacity(.6):null
        ),
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15.0),
        child: Row(
          children: [
            Text(
              lang,
              style: FontManager.getRegularStyle(fontSize: 18.6,height: 1),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,size: 16,color: ColorResources.black,)
          ],
        ),
      ),
    );
  }
}

