import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'package:safari_restaurant/features/order_history/widgets/order_history_body.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScaffold(
          child: OrderHistoryBody(state: state,),
        );
      },
    );
  }
}
