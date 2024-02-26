import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/features/order_details/widgets/order_details_item.dart';

import '../../../core/utils/font_manager.dart';

class OrderDetailsListItems extends StatelessWidget {
  const OrderDetailsListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'order_items'.tr(),
          style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
        ),
        const Gap(15),
        ListView.separated(
            itemBuilder: (c,i)=>OrderDetailsItem(),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (c,i)=>const Gap(10),
            itemCount: 3),
      ],
    );
  }
}
