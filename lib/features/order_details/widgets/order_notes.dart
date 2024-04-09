import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/widgets/custom_feild.dart';

import '../../../core/utils/font_manager.dart';

class OrderNotes extends StatelessWidget {
  OrderNotes({required this.noteController});

  TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'order_notes'.tr(),
          style: FontManager.getMediumStyle(fontSize: 21,color: Colors.black),
        ),
        const Gap(15),
        CustomField(
          controller: noteController,
          maxLines: null,
          readOnly: true,
        ),
      ],
    );
  }
}
