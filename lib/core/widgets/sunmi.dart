import 'package:easy_localization/easy_localization.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';

import '../../models/orders_model.dart';

class SunmiPrint{

  static Future<void> init()async{
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.startTransactionPrint(true);
  }


  static Future <void> printing(OrderData order) async {

    await SunmiPrinter.initPrinter();
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.startTransactionPrint(true);
    //printLogoImage();
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.printText('${order.providerName??''}',
        style: SunmiStyle(
          fontSize: SunmiFontSize.LG,
          bold: true,
          align: SunmiPrintAlign.CENTER,
        ));
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.printText(
        '${'order'.tr()} : #${order.itemNumber??''}',
        style: SunmiStyle(
          fontSize: SunmiFontSize.MD,
          bold: true,
          align: SunmiPrintAlign.CENTER,
        ));
    await SunmiPrinter.line();
    await SunmiPrinter.printText(
      '${'date_time'.tr()} : ${order.orderedDate??''}',
      style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.printText(
      '${'payment_type'.tr()} : ${order.paymentMethod??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.line();
    await SunmiPrinter.printText(
      '${'customer_name'.tr()} : ${order.userName??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.printText(
      '${'mobile_number'.tr()} : ${order.userPhone??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.printText(
      '${'address'.tr()} : ${order.userAddress?[0].title??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.line();
    for(Products product in order.products??[]){
      await SunmiPrinter.printText(
        'x${product.orderedQuantity??''}   ${product.title??''}   ${product.priceAfterDiscount??''}',
          style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
      );
      await SunmiPrinter.printText(
        '               ${'size'.tr()} :  ${product.selectedSizeName??''}',
          style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
      );
      if(product.types?.isNotEmpty??false)
        await SunmiPrinter.printText(
            '               ${'type'.tr()} :  ${product.types!.map((e) => e.name)}',
            style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
        );
      if(product.extras?.isNotEmpty??false)
        await SunmiPrinter.printText(
            '               ${'extra'.tr()} :  ${product.extras!.map((e) => e.name)}',
            style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
        );
    }
    await SunmiPrinter.line();
    if(order.giftType == 'product'|| order.giftType == 'wallets_price')
      await SunmiPrinter.printText(
          '${'gift'.tr()} : ${order.giftType == 'product'?order.giftProduct?.title??'':order.giftType == 'wallets_price'?'${'balance_in_wallet'.tr()} ${order.giftWalletsPriceId?.price??0}':''}',
          style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
      );
    await SunmiPrinter.printText(
        '${'delivery_charge'.tr()} : ${order.shippingCharges??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.printText(
        '${'subtotal'.tr()} : ${order.subTotalPrice??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.line();
    await SunmiPrinter.printText(
        '${'total_payment'.tr()} : ${order.totalPrice??''}',
        style: SunmiStyle(align:myLocale =='ar'? SunmiPrintAlign.RIGHT:SunmiPrintAlign.LEFT)
    );
    await SunmiPrinter.line();
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiPrinter.printQRCode('"https://www.google.com/maps/search/${order.userLatitude??'30.410868'},${order.userLongitude??'+31.569833'}?entry=tts"',size: 2,);
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.printText('thanks_you'.tr(),
        style: SunmiStyle(
          fontSize: SunmiFontSize.LG,
          bold: true,
          align: SunmiPrintAlign.CENTER,
        ));
    await SunmiPrinter.lineWrap(2);
    await SunmiPrinter.cut();
    await SunmiPrinter.exitTransactionPrint(true);
  }

}