import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';

import '../../../core/components/components.dart';
import '../../../core/utils/font_manager.dart';
import '../../../core/utils/image_resources.dart';

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({
    super.key,
  });

  @override
  State<AppVersionWidget> createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              openUrl('https://pavilion-teck.com/', context);
            },
            child: Row(
              children: [
                Text(
                  'powered_by'.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600,
                      fontSize: 12
                  ),
                ),
                const Gap(3),
                Image.asset(
                  ImageResources.pavilion,
                  width: 20.3,height: 25.2,
                ),
              ],
            )),
        const Spacer(),
        Text(
          '${'version'.tr()} $appVersion',
          style: FontManager.getRegularStyle(fontSize: 16.4),
        )
      ],
    );
  }
}