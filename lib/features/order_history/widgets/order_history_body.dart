import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:safari_restaurant/core/widgets/image_net.dart';
import 'package:safari_restaurant/core/widgets/pdf_receipt_widget.dart';
import 'package:safari_restaurant/core/widgets/print_button.dart';
import 'package:safari_restaurant/cubits/settings_cubit/settings_cubit.dart';
import 'package:safari_restaurant/features/order_history/widgets/search_widget.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../core/components/components.dart';
import '../../../core/components/constants.dart';
import '../../../core/utils/image_resources.dart';
import '../../../core/widgets/default_appbar.dart';
import '../../../core/widgets/shimmers/orders_shimmer.dart';
import '../../../core/widgets/sunmi.dart';
import '../../../models/orders_model.dart';
import '../../settings/settings_page.dart';
import 'calender_widget.dart';
import 'list_order_history.dart';

class OrderHistoryBody extends StatelessWidget {
  OrderHistoryBody({required this.state});

  SettingsState state;

  @override
  Widget build(BuildContext context) {
    var cubit = SettingsCubit.get(context);
    return RefreshIndicator(
      onRefresh: ()async{
        return Future.delayed(Duration.zero,(){
          cubit.getAllOrdersHistory();
        });
      },
      child: Column(
        children: [
          DefaultAppBar(
            title: 'order_history'.tr(),
            suffix: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ImageNet(
                image:cubit.restaurantModel?.data?.personalPhoto??'',
                width: 54,height: 54,
              ),
            ),
          ),
          SearchWidget(),
          if(cubit.showCalendar)
          CalenderWidget(),
          if(cubit.showCalendar)
            const Gap(20),
          Expanded(
            child: ConditionalBuilder(

              condition: state is! OrdersHistoryErrorState,

              fallback: (c)=>Center(child: Text('wrong'.tr())),

              builder: (c)=> ConditionalBuilder(

                condition: state is! OrdersHistoryLoadingState,

                fallback: (c)=>OrdersShimmer(),

                builder: (c)=> ConditionalBuilder(

                  condition: cubit.ordersModel!=null,

                  fallback: (c)=>OrdersShimmer(),

                  builder: (c)=> ConditionalBuilder(

                    condition: cubit.ordersModel?.data?.data?.isNotEmpty??false,

                    fallback: (c)=>Center(child: Text('no_orders_yet'.tr())),

                    builder: (c){

                      Future.delayed(
                          Duration.zero, ()=>cubit.paginationOrdersHistory());

                      return Stack(
                        children: [
                          ListHistoryOrder(),
                          Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: PrintButton(
                                  onTouch: ()async{
                                    cubit.ordersModel?.data?.data?.forEach((element) async{
                                      await SunmiPrint.printing(element);
                                    });

                                  },
                                  text: 'print_orders_abstract'.tr(),
                              ),
                          )
                        ],
                      );
                    }
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget pdWidget (OrderData order,font){
    pw.Widget defaultText(String text){
      return pw.Text(
        text,
        style: pw.TextStyle(
            font: font
        ),
      );
    }
    pw.Widget _orderItem(Products product,font){
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Row(
            children: [
              pw.Expanded(child: defaultText('${product.title??''}')),
              pw.Expanded(child: defaultText('x${product.orderedQuantity??''}')),
              pw.Expanded(child: defaultText('${product.priceAfterDiscount??''}')),
            ],
          ),
          defaultText('               ${'size'.tr()}:  ${product.selectedSizeName??''}'),
          if(product.types?.isNotEmpty??false)
            defaultText('               ${'type'.tr()} :  ${product.types!.map((e) => e.name)}'),
          if(product.extras?.isNotEmpty??false)
            defaultText('               ${'extra'.tr()} :  ${product.extras!.map((e) => e.name)}'),
        ],
      );
    }
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.min,
        children:[
          pw.SizedBox(height: 50),
          pw.Center(child: defaultText('${order.providerName??''}'),),
          defaultText('${'order'.tr()} : #${order.itemNumber??''}'),
          defaultText('${'date_time'.tr()} : ${order.orderedDate??''}'),
          defaultText('${'payment_type'.tr()} : ${order.paymentMethod??''}'),
          pw.Center(child: defaultText('========='),),
          defaultText('${'customer_name'.tr()} : ${order.userName??''}'),
          defaultText('${'mobile_number'.tr()} : ${order.userPhone??''}'),
          defaultText('${'address'.tr()} : ${order.userAddress?[0].title??''}'),
          pw.Center(child: defaultText('========='),),
          pw.Column(
            children: order.products?.map((e) => _orderItem(e,font)).
            toList()??[],
          ),
          pw.Center(child: defaultText('========='),),
          if(order.giftType == 'product'|| order.giftType == 'wallets_price')
            pw.Row(
              children: [
                defaultText('${'gift'.tr()} : ${order.giftType == 'product'?order.giftProduct?.title??'':order.giftType == 'wallets_price'?'balance_in_wallet'.tr():''}'),
                if(order.giftType == 'wallets_price')
                  pw.Spacer(),
                if(order.giftType == 'wallets_price')
                  defaultText('${order.giftWalletsPriceId?.price??''}'),
              ],
            ),
          pw.Row(
            children: [
              defaultText('delivery_charge'.tr()),
              pw.Spacer(),
              defaultText('${order.shippingCharges??''}'),
            ],
          ),
          pw.Row(
            children: [
              defaultText('subtotal'.tr()),
              pw.Spacer(),
              defaultText('${order.subTotalPrice??''}'),
            ],
          ),
          pw.Center(child: defaultText('========='),),
          pw.Row(
            children: [
              defaultText('total_payment'.tr()),
              pw.Spacer(),
              defaultText('${order.totalPrice??''}'),
            ],
          ),
          pw.Center(
            child: pw.BarcodeWidget(
              color: PdfColor.fromHex("#000000"),
              barcode: pw.Barcode.qrCode(),
              textStyle: pw.TextStyle(
                  font: font
              ),
              width: 100,
              height: 50,
              data: "https://www.google.com/maps/search/${order.userLatitude??'30.410868'},${order.userLongitude??'+31.569833'}?entry=tts",
            ),
          ),
          pw.Center(
            child: pw.Text(
              'thanks_you'.tr(),
              style: pw.TextStyle(
                  fontSize: 16,
                  font: font
              ),
            ),
          )
        ]
    );
  }
}
