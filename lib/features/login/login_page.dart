import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/form_validation.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_feild.dart';
import 'package:safari_restaurant/cubits/auth_cubit/auth_cubit.dart';
import 'package:safari_restaurant/features/login/widgets/login_contact_us.dart';
import 'package:safari_restaurant/features/login/widgets/login_fields.dart';
import 'package:safari_restaurant/features/login/widgets/login_header.dart';
import 'package:safari_restaurant/features/splash/splash_page.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/default_scaffold.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginFields loginFields = LoginFields();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if(AuthCubit.get(context).settingsModel==null){
      AuthCubit.get(context).getSettings();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScaffold(
          extendBody: true,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(size.height * .05),
                    const LoginHeader(),
                    loginFields,
                    CustomButton(
                      text: 'login_now'.tr(),
                      onTouch: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                              context: context,
                              email: loginFields.emailController.text.trim(),
                              password: loginFields.passwordController.text.trim()
                          );
                        }
                      },
                    ),
                    Gap(size.height * .15),
                    if(state is LoginErrorState)
                    LoginContactUs(state)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
