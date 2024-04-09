import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';

import '../../../cubits/settings_cubit/settings_cubit.dart';

class CrowdedStatusWidget extends StatelessWidget {
  const CrowdedStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(35),
        color: ColorResources.lightGrey.withOpacity(.3)
      ),
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          if(context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus == 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'not_crowded'.tr(),
            ),
          ),
          CircleAvatar(
            radius: 14,
            backgroundColor:context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus == 1
                ? ColorResources.kDefaultColor
                : Colors.red,
          ),
          if(context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus == 2)
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'crowded'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
