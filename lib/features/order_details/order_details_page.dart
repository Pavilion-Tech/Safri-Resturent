import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/order_details/widgets/order_details_body.dart';

import '../../core/widgets/default_appbar.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: OrderDetailsBody(),
    );
  }
}
