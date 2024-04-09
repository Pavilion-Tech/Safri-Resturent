import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/core/widgets/default_appbar.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/settings/widgets/app_version.dart';
import 'package:safari_restaurant/features/settings/widgets/language_bottomsheet.dart';
import 'package:safari_restaurant/features/settings/widgets/logout_bottomsheet.dart';
import 'package:safari_restaurant/features/settings/widgets/settings_item.dart';

import '../../cubits/settings_cubit/settings_cubit.dart';
import '../order_history/order_history_page.dart';
import '../terms&aboutus/aboutus_page.dart';
import '../terms&aboutus/terms_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScaffold(
          child: Column(
            children: [
              DefaultAppBar(title: 'settings'.tr()),
              const Gap(20),
              SettingsItem(
                onTouch: () {
                  showModalBottomSheet(context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => LanguageBottomSheet());
                },
                text: 'language'.tr(),
              ),
              SettingsItem(
                onTouch: () {
                  context.read<SettingsCubit>().removeCalendar();
                  context.read<SettingsCubit>().searchController.text = '';
                  context.read<SettingsCubit>().getAllOrdersHistory();
                  navigateTo(context, OrderHistoryPage());
                },
                text: 'order_history'.tr(),
              ),
              SettingsItem(
                onTouch: () {
                  navigateTo(context, TermsPage());
                },
                text: 'terms'.tr(),
              ),
              SettingsItem(
                onTouch: () {
                  navigateTo(context, HelpCenterPage());
                },
                text: 'help_center'.tr(),
              ),
              const Gap(20),
              AppVersionWidget(),
              const Gap(20),
              CustomButton(
                  text: 'logout'.tr(),
                  onTouch: () {
                    showModalBottomSheet(context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => LogoutBottomSheet());
                  }
              )
            ],
          ),
        );
      },
    );
  }
}
