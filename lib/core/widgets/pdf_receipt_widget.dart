import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:safari_restaurant/core/components/constants.dart';
import 'package:safari_restaurant/models/orders_model.dart';
import 'package:image/image.dart' as im;



class PDFReceipt{

  // imageFromPdfFile(File pdfFile) async {
  //   final document = await lib.PdfDocument.openFile(pdfFile.path);
  //   final page = await document.getPage(1);
  //   final pageImage = await page.render(width: page.width, height: page.height);
  //   await page.close();
  //   print(pageImage?.bytes);
  //
  //
  //   //... now convert
  //   // .... pageImage.bytes to image
  // }

  static void createPDF(OrderData order)async{


    final doc = pw.Document();

    
    doc.addPage(
      page(order)
    );


    final _convertPdfToImage = await Printing.raster(await doc.document.save());


    late im.Image image;
    await _convertPdfToImage.forEach((e)async{
      image= e.asImage();
    });
    print(image.height);
    print(image.width);
    print(image.data);



    // await for (var page in Printing.raster(doc.document.documentID)) {
    //   final image = page.asImage();
    //   print(image);
    // }


    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format)async => doc.save(),
      //format: PdfPageFormat(58 *(72/25.4), 297*(72/25.4),marginAll: 0,),
    );

  }

  static pw.Page page (OrderData order,){
    var font;
    rootBundle.load("assets/fonts/Cairo-Regular.ttf").then((value) {
      font = pw.Font.ttf(value);
    });

    pw.Widget defaultText(String text){
      return pw.Text(
        text,
        style: pw.TextStyle(
            font: font
        ),
      );
    }

    pw.Widget _orderItem(Products product,font){
      return pw.ListView(
        // crossAxisAlignment: pw.CrossAxisAlignment.start,
        // mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Row(
            children: [
              pw.Expanded(child:defaultText('${product.title??''}'),),
              pw.Expanded(child:defaultText('x${product.orderedQuantity??''}'),),
              pw.Expanded(child:defaultText('${product.priceAfterDiscount??''}'),),
            ],
          ),
          defaultText('               ${'size'.tr()} :  ${product.selectedSizeName??''}'),
          if(product.types?.isNotEmpty??false)
            defaultText('               ${'type'.tr()} :  ${product.types!.map((e) => e.name)}'),
          if(product.extras?.isNotEmpty??false)
            defaultText('               ${'extra'.tr()} :  ${product.extras!.map((e) => e.name)}'),
        ],
      );
    }



    return pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat(58 , 297*(72/25.4),marginAll: 5,),
          textDirection:myLocale =='ar'? pw.TextDirection.rtl:pw.TextDirection.ltr,
        ),
        build: (pw.Context context){
          return pw.ListView(
              // crossAxisAlignment: pw.CrossAxisAlignment.start,
              // mainAxisSize: pw.MainAxisSize.min,
              children:[
                pw.Center(child:defaultText('${order.providerName??''}'),),
                defaultText('${'order'.tr()} : #${order.itemNumber??''}'),
                defaultText('${'date_time'.tr()} : ${order.orderedDate??''}'),
                defaultText('${'payment_type'.tr()} : ${order.paymentMethod??''}'),
                pw.Center(child:defaultText('========='),),
                defaultText('${'customer_name'.tr()} : ${order.userName??''}'),
                defaultText('${'mobile_number'.tr()} : ${order.userPhone??''}'),
                defaultText('${'address'.tr()} : ${order.userAddress?[0].title??''}'),
                pw.Center(child: defaultText('===========',),),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  children: order.products?.map((e) => _orderItem(e,font)).
                  toList()??[],
                ),
                pw.Center(child:defaultText('========='),),
                if(order.giftType == 'product'|| order.giftType == 'wallets_price')
                  pw.Row(
                    children: [
                      defaultText('${'gift'.tr()} : ${order.giftType == 'product'?order.giftProduct?.title??'':order.giftType == 'wallets_price'?'balance_in_wallet'.tr():''}'),
                      if(order.giftType == 'wallets_price')
                        pw.Spacer(),
                      if(order.giftType == 'wallets_price')
                        defaultText('${order.giftWalletsPriceId?.price??''}')
                    ],
                  ),
                pw.Row(
                  children: [
                    defaultText('delivery_charge'.tr()),
                    pw.Spacer(),
                    defaultText('${order.shippingCharges??''}')
                  ],
                ),
                pw.Row(
                  children: [
                    defaultText('subtotal'.tr()),
                    pw.Spacer(),
                    defaultText('${order.subTotalPrice??''}'),
                  ],
                ),
                pw.Center(child:defaultText('========='),),
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
                    width: 70,
                    height: 70,
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
    );
  }

}