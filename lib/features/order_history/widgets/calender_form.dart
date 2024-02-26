import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safari_restaurant/core/widgets/custom_feild.dart';

import '../../../core/utils/color_resources.dart';
import '../../../core/utils/font_manager.dart';
import '../../../core/utils/image_resources.dart';

class CalenderForm extends StatelessWidget {

  CalenderForm({
    required this.label,
    required this.controller,
    required this.onTouch
});

  TextEditingController controller = TextEditingController();
  String label;
  VoidCallback onTouch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomField(
        controller: controller,
        prefix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImageResources.calender,width: 30,),
        ),
        label: label,
        readOnly: true,
        onTap: onTouch
      ),
    );
  }
}
