import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_states.dart';
import 'package:safari_restaurant/features/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: HomeBody(),
    );
  }
}
