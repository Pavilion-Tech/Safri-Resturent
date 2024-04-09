import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

import '../../../core/widgets/image_net.dart';
import '../../../models/orders_model.dart';

class OrderDetailsItem extends StatelessWidget {
  OrderDetailsItem({this.imageBigSize = true,this.products});


  Products? products;
  bool imageBigSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'x${products?.orderedQuantity??''} ${products?.title??''}',
            style: FontManager.getMediumStyle(
                fontSize: imageBigSize?22:18),
          ),
        ),
        const Gap(20),
        Container(
          height: imageBigSize?92:60,
          width: imageBigSize?92:60,
          decoration: BoxDecoration(
            color: ColorResources.lightGrey.withOpacity(.25),
            borderRadius: BorderRadiusDirectional.circular(17.5)
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ImageNet(image: products?.image??''),
        )
      ],
    );
  }
}
