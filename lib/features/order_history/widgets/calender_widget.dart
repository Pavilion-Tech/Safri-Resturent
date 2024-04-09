import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:safari_restaurant/core/utils/font_manager.dart';
import 'package:safari_restaurant/core/widgets/ui.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
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

  int? checkNum(String text,int index){
    String num = text.split('/')[index];
    return num.length ==2 ? null: 0;
  }

  String changeFormat(String text){
    return'${text.trim().split('/')[2]}-${checkNum(text,0)??''}${text.trim().split('/')[0]}-${checkNum(text,1)??''}${text.trim().split('/')[1]}';
  }

  void clearDate(BuildContext context){
    FocusManager.instance.primaryFocus?.unfocus();
    fromController.text = '';
    toController.text = '';
    setState(() {});
    context.read<SettingsCubit>().getAllOrdersHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                    fromController.text = DateFormat(null,'en').add_yMd()
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
                if(fromController.text.isNotEmpty){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse("2100-11-29"),
                  ).then((value) {
                    if(value!=null){
                      toController.text = DateFormat(null,'en').add_yMd()
                          .format(value)
                          .toString();
                      setState(() {});
                      String fromDate = changeFormat(fromController.text);
                      String toDate = changeFormat(toController.text);
                      context.read<SettingsCubit>().getAllOrdersHistory(
                          fromDate: fromDate,
                          toDate: toDate
                      );
                    }
                  });
                }else{
                  UIAlert.showAlert(context,
                      message: 'please_choose_from_date_first'.tr(),
                      type: MessageType.warning);
                }
              },
            ),

          ],
        ),
        if(toController.text.isNotEmpty)
        TextButton(
            onPressed: (){
              clearDate(context);
            },
            child: Text(
              'clear_date'.tr(),
              style: FontManager.getMediumStyle(color: Colors.red),
            ),
        ),
      ],
    );
  }
}
