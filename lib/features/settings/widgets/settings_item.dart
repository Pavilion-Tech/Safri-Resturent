import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';

class SettingsItem extends StatelessWidget {
  SettingsItem({
    required this.onTouch,
    required this.text
});

  String text;
  VoidCallback onTouch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTouch,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Text(
              text,
              style: FontManager.getRegularStyle(fontSize: 18.6),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,size: 16,color: ColorResources.black,)
          ],
        ),
      ),
    );
  }
}
