import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/features/home/widgets/order_item.dart';

class ListOrder extends StatelessWidget {
  const ListOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (c, i) => OrderItem(),
            separatorBuilder: (c, i) => const Gap(15),
            itemCount: 6
        );
      },
    );
  }
}
