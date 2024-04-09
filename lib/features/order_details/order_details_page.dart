import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/order_details/widgets/order_details_body.dart';

import '../../core/widgets/default_appbar.dart';
import '../../models/orders_model.dart';

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({required this.order,this.fromHome = true});


  bool fromHome;
  OrderData order;
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: OrderDetailsBody(order: order,fromHome: fromHome,),
    );
  }
}
