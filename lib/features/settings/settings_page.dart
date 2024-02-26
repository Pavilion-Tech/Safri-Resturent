import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/core/widgets/default_appbar.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/settings/widgets/language_bottomsheet.dart';
import 'package:safari_restaurant/features/settings/widgets/logout_bottomsheet.dart';
import 'package:safari_restaurant/features/settings/widgets/settings_item.dart';

import '../order_history/order_history_page.dart';
import '../terms&aboutus/aboutus_page.dart';
import '../terms&aboutus/terms_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Column(
        children: [
          DefaultAppBar(title: 'settings'.tr()),
          const Gap(20),
          SettingsItem(
            onTouch: (){
              showModalBottomSheet(context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context)=>LanguageBottomSheet());
            },
            text: 'language'.tr(),
          ),
          SettingsItem(
            onTouch: (){
              navigateTo(context, OrderHistoryPage());
            },
            text: 'order_history'.tr(),
          ),
          SettingsItem(
            onTouch: (){
              navigateTo(context, TermsPage());
            },
            text: 'terms'.tr(),
          ),
          SettingsItem(
            onTouch: (){
              navigateTo(context, AboutUsPage());
            },
            text: 'help_center'.tr(),
          ),
          const Gap(20),
          CustomButton(
              text: 'logout'.tr(),
              onTouch: (){
                showModalBottomSheet(context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context)=>LogoutBottomSheet());
              }
          )
        ],
      ),
    );
  }
}
