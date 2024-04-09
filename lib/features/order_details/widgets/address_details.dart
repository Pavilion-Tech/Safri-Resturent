import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

import '../../../models/orders_model.dart';

class AddressDetails extends StatelessWidget {
  AddressDetails({required this.order});

  OrderData order;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'address_details'.tr(),
          style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
        ),
        const Gap(15),
        Container(
          width: double.infinity,
          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(17.5),
            color: ColorResources.lightGrey.withOpacity(.3)
          ),
          child: Row(
            children: [
              Image.asset(ImageResources.location,width: 31.64,height: 31.64,),
              const Gap(4),
              Expanded(
                child: Text(
                  order.userAddress?[0].title??'',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,fontSize: 15,height: 1.7
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
