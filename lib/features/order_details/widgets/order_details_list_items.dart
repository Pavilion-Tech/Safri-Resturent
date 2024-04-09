import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/features/order_details/widgets/order_details_item.dart';
import 'package:safari_restaurant/models/orders_model.dart';

import '../../../core/utils/font_manager.dart';

class OrderDetailsListItems extends StatelessWidget {
  OrderDetailsListItems({required this.products});

  List<Products> products;

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
            itemBuilder: (c,i)=>OrderDetailsItem(products: products[i]),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (c,i)=>const Gap(10),
            itemCount: products.length),
      ],
    );
  }
}
