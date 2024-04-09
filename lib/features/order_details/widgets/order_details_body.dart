import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:safari_restaurant/core/components/components.dart';
import 'package:safari_restaurant/core/widgets/custom_button.dart';
import 'package:safari_restaurant/features/order_details/widgets/receipt_widget.dart';

import '../../../core/utils/color_resources.dart';
import '../../../core/utils/image_resources.dart';
import '../../../core/widgets/default_appbar.dart';
import '../../../core/widgets/pdf_receipt_widget.dart';
import '../../../core/widgets/print_button.dart';
import '../../../core/widgets/sunmi.dart';
import '../../../cubits/app_cubit/app_cubit.dart';
import '../../../cubits/app_cubit/app_states.dart';
import '../../../models/orders_model.dart';
import '../../settings/settings_page.dart';
import 'address_details.dart';
import 'customer_details.dart';
import 'order_details_list_items.dart';
import 'order_gifts.dart';
import 'order_notes.dart';

class OrderDetailsBody extends StatelessWidget {
  OrderDetailsBody({required this.order,this.fromHome = true});

  bool fromHome;

  OrderData order;



  @override
  Widget build(BuildContext context) {
    Uint8List image = Uint8List.fromList([137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 58, 0, 0, 0, 105, 8, 6, 0, 0, 0, 107, 161, 48, 113, 0, 0, 0, 4, 115, 66, 73, 84, 8, 8, 8, 8, 124, 8, 100, 136, 0, 0, 0, 46, 73, 68, 65, 84, 120, 156, 237, 193, 1, 13, 0, 0, 0, 194, 160, 247, 79, 109, 15, 7, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 26, 95, 145, 0, 1, 17, 53, 142, 71, 0, 0, 0, 0, 73, 69, 78, 68, 174, 66, 96, 130]);
    return Column(
      children: [
        DefaultAppBar(
          title: '#${order.itemNumber ?? ''}',
          suffix: InkWell(
            onTap: () => navigateTo(context, SettingPage()),
            child: Image.asset(ImageResources.menuIcon, width: 54, height: 54,),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    CustomerDetails(order: order,),
                    const Gap(20),
                    AddressDetails(
                      order: order,
                    ),
                    const Gap(20),
                    if(order.additionalNotes?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: OrderNotes(
                          noteController: TextEditingController(
                              text: order.additionalNotes!),
                        ),
                      ),
                    if(order.products?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: OrderDetailsListItems(
                          products: order.products!,
                        ),
                      ),
                    OrderGifts(
                      order: order,
                    ),
                    const Gap(20),
                    ReceiptWidget(
                      order: order,
                    ),
                    const Gap(170),
                  ],
                ),
              ),
              //PDFReceipt.previewPdf(order),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrintButton(
                      text: 'print_receipt'.tr(),
                      onTouch: () async {
                        print('hi');
                        await SunmiPrint.printing(order);
                        //PDFReceipt.createPDF(order);
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
                  if(order.status ==1 || order.status ==2)
                    BlocConsumer<AppCubit, AppStates>(
                      listener: (context, state) {},
                      builder: (c, state) {
                        return CustomButton(
                            text:order.status == 1
                                ? 'accept_order'.tr()
                                : 'on_delivery'.tr(),
                            color:order.status ==1
                                ?null
                                :ColorResources.black,
                            onTouch: () {
                              c.read<AppCubit>().changeOrderStatus(context,
                                id: order.id??'',
                                status: order.status! +1,
                                fromDetails: true,
                                fromHome:fromHome,
                              );
                            });
                      },
                    ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }


}
