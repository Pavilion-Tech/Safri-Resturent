import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/shimmers/default_shimmer.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';

import '../../../core/components/components.dart';
import '../../settings/settings_page.dart';
import 'crowded_status_widget.dart';

class HomeAppBar extends StatefulWidget {
  HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {



  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConditionalBuilder(
          condition: context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus !=null,
          fallback: (c)=>CustomShimmer(width: 103,height: 37.6,),
          builder: (c)=> AnimatedSwitcher(
            duration:const Duration(milliseconds: 500),
            transitionBuilder: (Widget child,Animation<double> animation){
              return ScaleTransition(scale: animation,child: child,);
            },
            child: InkWell(
              key: ValueKey(context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus == 1),
              onTap: (){
                int crowdedStatus = context.read<SettingsCubit>().
                restaurantModel!.data!.crowdedStatus!;
                context.read<SettingsCubit>().changeCrowdedStatus(
                    context,
                    status: crowdedStatus == 1? 2:1);
              },
              overlayColor: ColorResources.transparent,
              child: CrowdedStatusWidget(),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
            onTap: ()=>navigateTo(context, SettingPage()),
            overlayColor: ColorResources.transparent,
            child: Image.asset(ImageResources.menuIcon,width: 54,height: 54,)
        )
      ],
    );
  }
}
