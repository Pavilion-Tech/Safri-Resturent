import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/widgets/default_appbar.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/order_history/widgets/order_history_body.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Column(
        children: [
          DefaultAppBar(title: 'help_center'.tr()),
          const Gap(20),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Text(
                  '''Lorem Ipsum is simply dummy text of the printi is simply dummy text of the printi is simply dummy text of the printi is simply dummy text of the printi is simply dummy text of the printi is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy''',
                  style: FontManager.getRegularStyle(fontSize: 18,height: 2.2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
