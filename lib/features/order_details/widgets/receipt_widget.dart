import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import '../../../core/utils/font_manager.dart';
import '../../../models/orders_model.dart';


class ReceiptWidget  extends StatefulWidget{

  ReceiptWidget({required this.order});

  OrderData order;

  @override
  State<ReceiptWidget> createState() => _ReceiptWidgetState();
}

class _ReceiptWidgetState extends State<ReceiptWidget> {

  bool isShow = false;

  void changeVisibility(){
    setState(() {
      isShow = !isShow;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'order_receipt'.tr(),
            style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
          ),
          SizedBox(height: 10),
          ConditionalBuilder(
            condition: isShow,
            fallback: (c)=>Center(
              child: TextButton(
                  onPressed: changeVisibility,
                  child: Text(
                    'show_receipt'.tr(),
                    style: TextStyle(
                      decoration: TextDecoration.underline
                    ),
                  ),
              ),
            ),
            builder: (c)=> Container(
              width: double.infinity,
              padding:EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorResources.lightGrey.withOpacity(.5),
                    ColorResources.lightGrey.withOpacity(.2),
                    ColorResources.lightGrey.withOpacity(.5),
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${widget.order.providerName??''}',
                      style: FontManager.getRegularStyle(fontSize: 28),
                    ),
                  ),
                  Text(
                    '${'order'.tr()} : #${widget.order.itemNumber??''}',
                    style: FontManager.getRegularStyle(),
                  ),
                  Text(
                    '${'date_time'.tr()} : ${widget.order.orderedDate??''}',
                    style: FontManager.getRegularStyle(),
                  ),
                  Text(
                    '${'payment_type'.tr()} : ${widget.order.paymentMethod??''}',
                    style: FontManager.getRegularStyle(),
                  ),
                  Center(
                    child: Text(
                      '==================',
                      style: FontManager.getRegularStyle(),
                    ),
                  ),
                  Text(
                    '${'customer_name'.tr()} : ${widget.order.userName??''}',
                    style: FontManager.getRegularStyle(),
                  ),
                  Text(
                    '${'mobile_number'.tr()} : ${widget.order.userPhone??''}',
                    style: FontManager.getRegularStyle(),
                  ),
                  Text(
                    '${'address'.tr()} : ${widget.order.userAddress?[0].title??''}',
                    style: FontManager.getRegularStyle(),
                  ),
                  Center(
                    child: Text(
                      '==========================================',
                      maxLines: 1,
                      style: FontManager.getRegularStyle(fontSize: 20),
                    ),
                  ),
                  Column(
                    children: widget.order.
                    products?.
                    map((e) =>
                        orderItem(e)).
                    toList()??[],
                  ),
                  Center(
                    child: Text(
                      '==============================================',
                      maxLines: 1,
                      style: FontManager.getRegularStyle(fontSize: 20),
                    ),
                  ),
                  if(widget.order.giftType == 'product'|| widget.order.giftType == 'wallets_price')
                  Row(
                    children: [
                      Text(
                        '${'gift'.tr()} : ${widget.order.giftType == 'product'?widget.order.giftProduct?.title??'':widget.order.giftType == 'wallets_price'?'balance_in_wallet'.tr():''}',
                        style: FontManager.getRegularStyle(),
                      ),
                      if(widget.order.giftType == 'wallets_price')
                      const Spacer(),
                      if(widget.order.giftType == 'wallets_price')
                      Text(
                        '${widget.order.giftWalletsPriceId?.price??0}',
                        style: FontManager.getRegularStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'delivery_charge'.tr(),
                        style: FontManager.getRegularStyle(),
                      ),
                      const Spacer(),
                      Text(
                        '${widget.order.shippingCharges??''}',
                        style: FontManager.getRegularStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'subtotal'.tr(),
                        style: FontManager.getRegularStyle(),
                      ),
                      const Spacer(),
                      Text(
                        '${widget.order.subTotalPrice??''}',
                        style: FontManager.getRegularStyle(),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      '==============================================',
                      maxLines: 1,
                      style: FontManager.getRegularStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'total_payment'.tr(),
                        style: FontManager.getSemiBold(fontSize: 20),
                      ),
                      const Spacer(),
                      Text(
                        '${widget.order.totalPrice??''}',
                        style: FontManager.getSemiBold(fontSize: 20),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Center(
                    child: QrImageView(
                      data: 'https://www.google.com/maps/search/${widget.order.userLatitude??'30.410868'},${widget.order.userLongitude??'+31.569833'}?entry=tts',
                      version: QrVersions.auto,
                      size: 100.0,
                    ),
                  ),
                  const Gap(10),
                  Center(
                    child: Text(
                      'thanks_you'.tr(),
                      style: FontManager.getSemiBold(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget orderItem(Products product){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${product.title??''}',
                style: FontManager.getRegularStyle(),
              ),
            ),
            Expanded(
              child: Text(
                'x${product.orderedQuantity??''}',
                style: FontManager.getRegularStyle(),
              ),
            ),
            Expanded(
              child: Text(
                '${product.priceAfterDiscount??''}',
                style: FontManager.getRegularStyle(),
              ),
            ),
          ],
        ),
        Text(
          '               ${'size'.tr()}:                ${product.selectedSizeName??''}',
          style: FontManager.getRegularStyle(),
        ),
        if(product.types?.isNotEmpty??false)
        Text(
          '               ${'type'.tr()} :                ${product.types!.map((e) => e.name)}',
          style: FontManager.getRegularStyle(),
        ),
        if(product.extras?.isNotEmpty??false)
          Text(
          '               ${'extra'.tr()} :               ${product.extras!.map((e) => e.name)}',
          style: FontManager.getRegularStyle(),
        ),
      ],
    );
  }
}
