import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import '../../../core/utils/font_manager.dart';


class ReceiptWidget  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'order_receipt'.tr(),
          style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
        ),
        SizedBox(height: 10),
        Container(
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
                  'SAFARI',
                  style: FontManager.getRegularStyle(fontSize: 28),
                ),
              ),
              Text(
                '${'order'.tr()} : #32142',
                style: FontManager.getRegularStyle(),
              ),
              Text(
                '${'date_time'.tr()} : 2/26/2024 10:00',
                style: FontManager.getRegularStyle(),
              ),
              Text(
                '${'payment_type'.tr()} : Pay On Delivery',
                style: FontManager.getRegularStyle(),
              ),
              Center(
                child: Text(
                  '==================',
                  style: FontManager.getRegularStyle(),
                ),
              ),
              Text(
                '${'customer_name'.tr()} : Ahmed',
                style: FontManager.getRegularStyle(),
              ),
              Text(
                '${'mobile_number'.tr()} : 01223364710',
                style: FontManager.getRegularStyle(),
              ),
              Text(
                '${'address'.tr()} : Belbies Sharkia Egypt',
                style: FontManager.getRegularStyle(),
              ),
              Center(
                child: Text(
                  '==========================================',
                  maxLines: 1,
                  style: FontManager.getRegularStyle(fontSize: 20),
                ),
              ),
              orderItem(),
              orderItem(),
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
                    '${'gift'.tr()} : Cinnamon Twist           %50',
                    style: FontManager.getRegularStyle(),
                  ),
                  const Spacer(),
                  Text(
                    '2.0',
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
                    '2.0',
                    style: FontManager.getRegularStyle(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'discount'.tr(),
                    style: FontManager.getRegularStyle(),
                  ),
                  const Spacer(),
                  Text(
                    '2.0',
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
                    '10.0',
                    style: FontManager.getSemiBold(fontSize: 20),
                  ),
                ],
              ),
              const Gap(40),
              Center(
                child: QrImageView(
                  data: 'https://www.google.com/maps/search/30.410868,+31.569833?entry=tts',
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
        )
      ],
    );
  }

  Widget orderItem(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Pizza',
                style: FontManager.getRegularStyle(),
              ),
            ),
            Expanded(
              child: Text(
                'x2',
                style: FontManager.getRegularStyle(),
              ),
            ),
            Expanded(
              child: Text(
                '3.500',
                style: FontManager.getRegularStyle(),
              ),
            ),
          ],
        ),
        Text(
          '               ${'size'.tr()}:                Middle',
          style: FontManager.getRegularStyle(),
        ),
        Text(
          '               ${'type'.tr()} :                Spicy',
          style: FontManager.getRegularStyle(),
        ),
        Text(
          '               ${'extra'.tr()} :                Cheese',
          style: FontManager.getRegularStyle(),
        ),
      ],
    );
  }
}
