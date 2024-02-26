import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'home_appbar.dart';
import 'list_order.dart';
import 'order_item.dart';
import 'order_types.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          HomeAppBar(),
          OrderTypes(),
          Expanded(child: ListOrder())
        ],
      ),
    );
  }
}
