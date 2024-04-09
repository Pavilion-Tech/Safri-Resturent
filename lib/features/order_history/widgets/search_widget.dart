import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/utils/color_resources.dart';
import 'package:safari_restaurant/core/utils/image_resources.dart';
import 'package:safari_restaurant/core/widgets/custom_feild.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';

import 'calender_form.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Expanded(
              child: CustomField(
                controller: context.read<SettingsCubit>().searchController,
                hint: 'search_hint'.tr(),
                inputType: TextInputType.number,
                onChanged: (val){
                  context.read<SettingsCubit>().getAllOrdersHistory();

                  if(val?.isEmpty??false){
                    Future.delayed(Duration(seconds: 3),(){
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  }
                },
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(ImageResources.search,width: 28,height: 28,),
                ),
              ),
          ),
          const Gap(10),
          InkWell(
            onTap: (){
              if(!context.read<SettingsCubit>().showCalendar){
                context.read<SettingsCubit>().showingCalendar();
              }

              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              width: 66,height: 66,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                color: ColorResources.kDefaultColor
              ),
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                context.read<SettingsCubit>().showCalendar
                    ?ImageResources.search
                    :ImageResources.filter,
                width: 36,color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
