import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/wrong_pages/widgets/wrong_widget.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child:WrongWidget(
        title: 'no_connection_title',
        description: 'no_connection_description',
        image: ImageResources.noConnection,
        button: CustomButton(
          onTouch: (){},
          text: 'reload_now'.tr(),
        ),
      ),
    );
  }
}
