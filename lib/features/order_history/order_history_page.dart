import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/order_history/widgets/order_history_body.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: OrderHistoryBody(),
    );
  }
}
