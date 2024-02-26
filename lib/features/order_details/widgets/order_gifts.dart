import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

import '../../../core/utils/font_manager.dart';
import 'order_details_item.dart';

class OrderGifts extends StatelessWidget {
  const OrderGifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Gifts Of Order',
              style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
            ),
            const Gap(10),
            Image.asset(ImageResources.gift,width: 28,height: 28,)
          ],
        ),
        const Gap(10),
        ListOrderGifts()
      ],
    );
  }
}



class ListOrderGifts extends StatelessWidget {
  const ListOrderGifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (c,i)=>OrderDetailsItem(imageBigSize: false),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (c,i)=>const Gap(10),
        itemCount: 2);
  }
}




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

