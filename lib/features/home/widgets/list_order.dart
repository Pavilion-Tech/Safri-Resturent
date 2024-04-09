import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/features/home/widgets/order_item.dart';

import '../../../models/orders_model.dart';

class ListOrder extends StatelessWidget {
  ListOrder({required this.orders});

  List<OrderData> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c, i) => OrderItem(
          order: orders[i],
        ),
        controller: context.read<AppCubit>().orderScrollController,
        separatorBuilder: (c, i) => const Gap(15),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: orders.length
    );
  }
}
