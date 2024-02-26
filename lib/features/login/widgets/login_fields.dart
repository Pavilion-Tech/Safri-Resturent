import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';

import '../../../core/utils/form_validation.dart';
import '../../../core/utils/image_resources.dart';
import '../../../core/widgets/custom_feild.dart';

class LoginFields extends StatefulWidget {
  LoginFields({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {


  void changePasswordVisibility(){
    setState(() {
      isPassword = !isPassword;
    });
  }

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        CustomField(
          controller: widget.emailController,
          hint: 'write_email'.tr(),
          label: 'email'.tr(),
          inputType: TextInputType.emailAddress,
          suffix: Image.asset(ImageResources.mailIcon,width: 23.3,),
          validator: FormValidation.validateFormEmail,
        ),
        const Gap(20),
        CustomField(
          controller: widget.passwordController,
          hint: 'write_password'.tr(),
          label: 'password'.tr(),
          isPassword: isPassword,
          inputType: const TextInputType.numberWithOptions(
              decimal: true,signed: true),
          suffix: AnimatedSwitcher(
            duration:const Duration(milliseconds: 500),
            transitionBuilder: (Widget child,Animation<double> animation){
              return ScaleTransition(scale: animation,child: child,);
            },
            switchInCurve: Curves.bounceInOut,
            switchOutCurve: Curves.fastOutSlowIn,
            child: InkWell(
                key: ValueKey(isPassword),
                overlayColor: ColorResources.transparent,
                onTap: changePasswordVisibility,
                child: Icon(
                  isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined,
                  color: Colors.grey,
                )),
          ),
          validator: FormValidation.passwordValidation,
        ),
        const Gap(30),
      ],
    );
  }
}
