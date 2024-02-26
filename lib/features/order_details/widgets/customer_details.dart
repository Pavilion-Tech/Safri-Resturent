import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageResources.greenPhone,height: 52.3,width: 52.3,),
              const Gap(4),
              Text(
                '+965 3262 5151 185',
                style: FontManager.getSemiBold(fontSize: 21.3),
              )
            ],
          ),
          const Gap(10),
          Text(
            'Mohamed Sayed Salem',
            style: FontManager.getSemiBold(fontSize: 22),
          )
        ],
      ),
    );
  }
}
