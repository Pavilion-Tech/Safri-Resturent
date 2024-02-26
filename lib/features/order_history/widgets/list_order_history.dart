import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/features/home/widgets/order_item.dart';

import 'order_history_item.dart';

class ListHistoryOrder extends StatelessWidget {
  const ListHistoryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (c, i) => OrderHistoryItem(),
          padding:const EdgeInsets.only(bottom: 80),
          separatorBuilder: (c, i) => const Gap(15),
          itemCount: 6
      ),
    );
  }
}
