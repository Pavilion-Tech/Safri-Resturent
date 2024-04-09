import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/widgets/default_appbar.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'package:safari_restaurant/features/order_history/widgets/order_history_body.dart';

import '../../core/components/constants.dart';
import '../../core/widgets/shimmers/lines_shimmer.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
  listener: (context, state) {},
  builder: (context, state) {
    return DefaultScaffold(
      child: Column(
        children: [
          DefaultAppBar(title: 'terms'.tr()),
          const Gap(20),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: ConditionalBuilder(
                  condition: context.read<SettingsCubit>().staticPagesModel !=null,
                  fallback: (c)=>LinesShimmer(),
                  builder: (c)=> Html(
                      data:myLocale =="en"
                          ?context.read<SettingsCubit>().staticPagesModel!.data!.termsAndConditiondsEn
                          :context.read<SettingsCubit>().staticPagesModel!.data!.termsAndConditiondsAr
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  },
);
  }
}
