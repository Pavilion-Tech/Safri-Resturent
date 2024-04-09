import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/features/home/widgets/payment_widget.dart';

import '../../../core/utils/color_resources.dart';
import '../../../models/orders_model.dart';
import '../../order_details/order_details_page.dart';

class OrderItem extends StatelessWidget {
  OrderItem({required this.order});

  OrderData order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(23.3),
        color: ColorResources.lightGrey.withOpacity(.25)
      ),
      padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset(ImageResources.phone,width: 23.6,height: 23.6,),
              // const Gap(10),
              Expanded(
                child: Text(
                  order.userName??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontManager.getRegularStyle(fontSize: 15.6),
                ),
              ),
              Text(
                '#${order.itemNumber??'0'}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontManager.getSemiBold(fontSize: 17.6),
              )
            ],
          ),
          const Gap(10),
          Column(
            children: order.
            products?.
            map((e) =>
                ProductText('x${e.orderedQuantity??'0'} ${e.title??''}')).
            toList()??[],
          ),
          if(context.read<AppCubit>().currentOrderType == 2)
          PaymentWidget(order.paymentMethod??''),
          const Gap(10),
          Row(
            children: [
              InkWell(
                onTap: (){
                  navigateTo(context, OrderDetailsPage(order: order,));
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    const Gap(5),
                    Text(
                      'view_order_details'.tr(),
                      style: FontManager.getMediumStyle(fontSize: 12.3),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Expanded(
                child: CustomButton(
                    text: context.read<AppCubit>().currentOrderType ==1
                        ?'accept_order'.tr()
                        : 'on_delivery'.tr(),
                    onTouch: (){
                      context.read<AppCubit>().changeOrderStatus(context,
                          id: order.id??'',
                        status: context.read<AppCubit>().currentOrderType ==1
                            ?2
                            :3
                      );
                    },
                  width: null,
                  color:context.read<AppCubit>().currentOrderType ==1
                      ?null
                      :ColorResources.black,
                  height: 43,
                  textStyle: FontManager.getSemiBold(
                      fontSize: 12.3,color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}


class ProductText extends StatelessWidget {
  ProductText(this.text);
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: FontManager.getMediumStyle(fontSize: 9.6),
      ),
    );
  }
}

