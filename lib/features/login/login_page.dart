import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/core/utils/form_validation.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_feild.dart';
import 'package:safari_restaurant/features/login/widgets/login_contact_us.dart';
import 'package:safari_restaurant/features/login/widgets/login_fields.dart';
import 'package:safari_restaurant/features/login/widgets/login_header.dart';
import 'package:safari_restaurant/features/splash/splash_page.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/default_scaffold.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginFields loginFields = LoginFields();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      extendBody: true,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(size.height*.05),
                const LoginHeader(),
                loginFields,
                CustomButton(
                  text: 'login_now'.tr(),
                  onTouch: (){
                    if(formKey.currentState!.validate()){
                      navigateAndFinish(context, HomePage());
                    }
                  },
                ),
                Gap(size.height*.15),
                LoginContactUs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
