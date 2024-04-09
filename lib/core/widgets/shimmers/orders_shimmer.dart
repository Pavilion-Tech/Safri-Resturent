import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/widgets/shimmers/default_shimmer.dart';

class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (c, i) => CustomShimmer(height: 120,radius: 24,),
        separatorBuilder: (c, i) => const Gap(15),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6
    );
  }
}
