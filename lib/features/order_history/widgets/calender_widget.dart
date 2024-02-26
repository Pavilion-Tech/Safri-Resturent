import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../core/components/constants.dart';
import 'calender_form.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  TextEditingController fromController =
  TextEditingController();

  TextEditingController toController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CalenderForm(
          label: 'from'.tr(),
          controller: fromController,
          onTouch: (){
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.parse("2100-11-29"),
            ).then((value) {
              if(value!=null){
                fromController.text = DateFormat(null,myLocale).add_yMd()
                    .format(value)
                    .toString();
                setState(() {});
              }
            });
          },
        ),
        const Gap(35),
        CalenderForm(
          label: 'to'.tr(),
          controller: toController,
          onTouch: (){
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.parse("2100-11-29"),
            ).then((value) {
              if(value!=null){
                toController.text = DateFormat(null,myLocale).add_yMd()
                    .format(value)
                    .toString();
                setState(() {});
              }
            });
          },
        ),
      ],
    );
  }
}
