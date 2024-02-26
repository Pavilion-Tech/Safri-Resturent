import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

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
          'Pay On Delivery',
          style: FontManager.getRegularStyle(fontSize: 16),
        ),
      ),
    );
  }
}
