import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/wrong_pages/widgets/wrong_widget.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child:WrongWidget(
        title: 'update_title',
        description: 'update_description',
        image: ImageResources.update,
        button: CustomButton(
          onTouch: (){},
          text: 'update_now'.tr(),
        ),
      ),
    );
  }
}
