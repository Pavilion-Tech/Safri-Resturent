import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/features/order_details/widgets/receipt_widget.dart';

import '../../../core/utils/image_resources.dart';
import '../../../core/widgets/default_appbar.dart';
import '../../../core/widgets/print_button.dart';
import '../../settings/settings_page.dart';
import 'address_details.dart';
import 'customer_details.dart';
import 'order_details_list_items.dart';
import 'order_gifts.dart';
import 'order_notes.dart';
import 'package:pdf/widgets.dart' as pw;


class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultAppBar(
          title: '#4355544',
          suffix: InkWell(
            onTap: ()=>navigateTo(context, SettingPage()),
            child: Image.asset(ImageResources.menuIcon,width: 54,height: 54,),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomerDetails(),
                const Gap(20),
                AddressDetails(),
                const Gap(20),
                OrderNotes(),
                const Gap(20),
                OrderDetailsListItems(),
                const Gap(20),
                OrderGifts(),
                const Gap(20),
                ReceiptWidget(),
                const Gap(20),
                PrintButton(
                  text:'print_receipt'.tr(),
                  onTouch:()async{
                    // final doc = pw.Document();
                    //
                    // doc.addPage(pw.Page(
                    //     pageFormat: PdfPageFormat.a4,
                    //     build: (pw.Context pContext) {
                    //       return ReceiptWidget(); // Center
                    //     }));
                    // await Printing.layoutPdf(onLayout: (PdfPageFormat format)async=>doc.save());
                  }
                ),
                const Gap(20),
                CustomButton(text: 'accept_order'.tr(), onTouch: (){}),
              ],
            ),
          ),
        )
      ],
    );
  }
}
