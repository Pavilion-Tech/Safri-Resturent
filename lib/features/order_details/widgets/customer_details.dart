import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

import '../../../core/components/components.dart';
import '../../../models/orders_model.dart';

class CustomerDetails extends StatelessWidget {
  CustomerDetails({required this.order});

  OrderData order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              openUrl('tel://${order.userPhone??''}', context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(ImageResources.greenPhone,height: 52.3,width: 52.3,),
                const Gap(4),
                Text(
                  order.userPhone??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontManager.getSemiBold(fontSize: 21.3),
                )
              ],
            ),
          ),
          const Gap(10),
          Text(
            order.userName??'',
            style: FontManager.getSemiBold(fontSize: 22),
          )
        ],
      ),
    );
  }
}
