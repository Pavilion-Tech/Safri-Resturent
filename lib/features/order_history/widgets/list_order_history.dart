import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'package:safari_restaurant/features/home/widgets/order_item.dart';
import 'package:safari_restaurant/models/orders_model.dart';

import 'order_history_item.dart';

class ListHistoryOrder extends StatelessWidget {
  const ListHistoryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c, i) => OrderHistoryItem(
          order: context.read<SettingsCubit>().ordersModel?.data?.data?[i]??OrderData(),
        ),
        padding:const EdgeInsets.only(bottom: 80),
        separatorBuilder: (c, i) => const Gap(15),
        physics: const AlwaysScrollableScrollPhysics(),
        controller: context.read<SettingsCubit>().orderScrollController,
        itemCount: context.read<SettingsCubit>().ordersModel?.data?.data?.length??0
    );
  }
}
