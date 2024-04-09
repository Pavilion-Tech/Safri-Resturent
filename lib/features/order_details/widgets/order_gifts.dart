import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

import '../../../core/utils/font_manager.dart';
import '../../../models/orders_model.dart';
import 'order_details_item.dart';

class OrderGifts extends StatelessWidget {
  OrderGifts({required this.order});

  OrderData order;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: order.giftType != 'coupoun',
      fallback: (c)=>SizedBox(),
      builder: (c)=> ConditionalBuilder(
        condition: order.giftWalletsPriceId!=null||order.giftProduct?.title !=null,
        fallback: (c)=>SizedBox(),
        builder: (c)=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'gifts_of_order'.tr(),
                  style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
                ),
                const Gap(10),
                Image.asset(ImageResources.gift,width: 28,height: 28,)
              ],
            ),
            const Gap(10),
            ConditionalBuilder(
              condition: order.giftType == 'product',
              fallback: (c)=>Text(
                '${'balance_in_wallet'.tr()} ${order.giftWalletsPriceId?.price??''} KWD'
              ),
              builder: (c)=> OrderDetailsItem(
                imageBigSize: false,
                products: Products(
                  image: order.giftProduct?.image??'',
                  title: order.giftProduct?.title??''
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class ListOrderGifts extends StatelessWidget {
//   const ListOrderGifts({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  ListView.separated(
//         itemBuilder: (c,i)=>OrderDetailsItem(imageBigSize: false),
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         separatorBuilder: (c,i)=>const Gap(10),
//         itemCount: 2);
//   }
// }




class NoGifts extends StatelessWidget {
  const NoGifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15),
        color: ColorResources.lightGrey.withOpacity(.25)
      ),
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Text(
        'Order Has No Gifts',
        style: FontManager.getRegularStyle(fontSize: 16),
      ),
    );
  }
}

