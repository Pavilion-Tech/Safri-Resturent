import 'package:flutter/material.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/core/widgets/default_scaffold.dart';
import 'package:safari_restaurant/features/wrong_pages/widgets/wrong_widget.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child:WrongWidget(
        title: 'maintenance_title',
        description: 'maintenance_description',
        image: ImageResources.maintenance,
      ),
    );
  }
}
