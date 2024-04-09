import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'package:safari_restaurant/features/home/widgets/restaurant_crowded_widget.dart';
import 'package:safari_restaurant/models/orders_model.dart';

import '../../../core/widgets/shimmers/orders_shimmer.dart';
import 'home_appbar.dart';
import 'list_order.dart';
import 'order_item.dart';
import 'order_types.dart';

class HomeBody extends StatelessWidget {
  HomeBody({required this.state});

  AppStates state;

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return RefreshIndicator(
      onRefresh: ()async{
        return  Future.delayed(Duration.zero,(){
          cubit.getAllOrders();
        });
      },
      child: Column(
        children: [
          HomeAppBar(),
          if(context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus ==1)
          OrderTypes(),
          Expanded(
            child: ConditionalBuilder(
              condition: state is! OrdersErrorState,
              fallback: (c)=>Center(child: Text('wrong'.tr())),
              builder: (c)=> ConditionalBuilder(
                  condition: cubit.ordersModel!=null,
                  fallback: (c)=>OrdersShimmer(),
                  builder: (c)=> ConditionalBuilder(
                    condition: cubit.ordersModel!.data!.data!.isNotEmpty,
                    fallback: (c)=>Center(child: Text('no_orders_yet'.tr())),
                    builder: (c)=>ConditionalBuilder(
                      condition: context.read<SettingsCubit>().restaurantModel?.data?.crowdedStatus ==1,
                      fallback: (c)=>RestaurantCrowdedWidget(),
                      builder: (c){
                        // this future delayed for pagination orders list
                        Future.delayed(
                            Duration.zero, ()=>cubit.paginationOrders());
                        return Column(
                          children: [
                            Expanded(
                              child: ListOrder(
                                orders:cubit.ordersModel!.data!.data!,
                              ),
                            ),
                            if(state is OrdersLoadingState)
                              const CupertinoActivityIndicator()
                          ],
                        );
                      },
                    )

                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
