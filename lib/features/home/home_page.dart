import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/cubits/app_cubit/app_cubit.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'package:safari_restaurant/features/home/widgets/home_body.dart';
import 'package:safari_restaurant/features/wrong_pages/no_connection_page.dart';
import '../../core/components/components.dart';
import '../../cubits/app_cubit/app_states.dart';
import '../wrong_pages/maintenance_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) async{
        if(!isConnect){
          navigateAndFinish(context, NoConnectionPage());
        }
        if(context.read<SettingsCubit>().settingsModel?.data?.isProjectInFactoryMode == 2){
          navigateAndFinish(context, MaintenancePage());
        }
      },
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state2) {
            return DefaultScaffold(
              child: HomeBody(state: state2),
            );
            },
        );
      },
    );
  }
}
