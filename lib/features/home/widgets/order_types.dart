import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';

import '../../../cubits/app_cubit/app_states.dart';

class OrderTypes extends StatefulWidget {
  OrderTypes({Key? key}) : super(key: key);

  @override
  State<OrderTypes> createState() => _OrderTypesState();
}

class _OrderTypesState extends State<OrderTypes> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size.width,height: 69,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(46.5),
              color: ColorResources.lightGrey.withOpacity(.3)
            ),
          ),
          AnimatedAlign(
            alignment:AppCubit.get(context).currentOrderType == 1
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd,
            duration:const Duration(milliseconds: 100),
            child: Container(
              width: size.width*.45,height: 69,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(46.5),
                  color: ColorResources.kDefaultColor
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: ()=>AppCubit.get(context).changeOrderType(1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'new_orders'.tr() +(AppCubit.get(context).currentOrderType == 1? ' (${AppCubit.get(context).ordersModel?.data?.count??' '})':''),
                        style: FontManager.getSemiBold(
                          fontSize: 16,
                          color: AppCubit.get(context).currentOrderType == 1
                              ?Colors.white:null
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: ()=>AppCubit.get(context).changeOrderType(2),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'accepted_orders'.tr() +(AppCubit.get(context).currentOrderType == 2? ' (${AppCubit.get(context).ordersModel?.data?.count??' '})':''),
                        style: FontManager.getSemiBold(
                            fontSize: 16,
                            color: AppCubit.get(context).currentOrderType == 2
                                ?Colors.white:null
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
