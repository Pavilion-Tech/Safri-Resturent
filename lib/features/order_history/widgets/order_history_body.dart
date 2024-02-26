import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/widgets/print_button.dart';
import 'package:safari_restaurant/features/order_history/widgets/search_widget.dart';

import '../../../core/components/components.dart';
import '../../../core/utils/image_resources.dart';
import '../../../core/widgets/default_appbar.dart';
import '../../settings/settings_page.dart';
import 'calender_widget.dart';
import 'list_order_history.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            DefaultAppBar(
              title: 'order_history'.tr(),
              suffix: Image.asset(ImageResources.store,width: 54,height: 54,),
            ),
            SearchWidget(),
            CalenderWidget(),
            const Gap(20),
            ListHistoryOrder(),
          ],
        ),
        Align(
        alignment: AlignmentDirectional.bottomCenter,
            child: PrintButton(onTouch: (){}, text: 'print_orders_abstract'.tr()))
      ],
    );
  }
}
