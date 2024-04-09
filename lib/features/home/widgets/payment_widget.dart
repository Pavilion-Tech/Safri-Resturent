import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';

class PaymentWidget extends StatelessWidget {
  PaymentWidget(this.method);

  String method;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        width: double.infinity,height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.white
        ),
        padding:const EdgeInsets.symmetric(horizontal: 30),
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          method.tr(),
          style: FontManager.getRegularStyle(fontSize: 16),
        ),
      ),
    );
  }
}
