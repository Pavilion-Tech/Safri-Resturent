import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/ui.dart';


Future<void> openUrl(String url,BuildContext context) async {
  print(url);
  if(await canLaunchUrl(Uri.parse(url))){
    await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
  }else{
    UIAlert.showAlert(context,message: 'This Url can\'t Launch');
  }
}

void whatAppContact({String phone = '01223364710'}) {
  String url;
  if (Platform.isAndroid) {
    // add the [https]
    url =  "https://wa.me/${phone}/?text=${Uri.parse('Hello')}"; // new line
  } else {
    // add the [https]
    url = "https://api.whatsapp.com/send?phone=$phone}=&text=${Uri.parse('Hello')}"; // new line
  }
  launchUrl(Uri.parse(url));
}


void navigateTo(context, widget) {
  Navigator.push(
    context,
    PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        }
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        }
    ),
        (route) => false,
  );
}




// checkNet(context) {
//   if (!isConnect!) {
//     navigateTo(context,NoNet(),);
//   }
// }

