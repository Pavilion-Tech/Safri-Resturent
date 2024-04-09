import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';

class RestaurantCrowdedWidget extends StatelessWidget {
  const RestaurantCrowdedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImageResources.busy,height: size.height*.3,),
          Padding(
            padding: const EdgeInsets.only(bottom: 40,top: 20),
            child: Text('crowded_note'.tr(),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
