

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'custom_progress_indecator.dart';

enum MessageType { error, success, warning }

class UIAlert {

  static void showAlert(context, {required message, type}) {
    Toastification().show(
      context: context,
      title: Text(message ?? "",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),),
      //style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      progressBarTheme: ProgressIndicatorThemeData(color: Colors.white,circularTrackColor: Colors.grey.shade600),
      backgroundColor: type == MessageType.error
          ? Colors.redAccent
          : type == MessageType.success
          ? Colors.green[200]
          : type == MessageType.warning
          ? Colors.amber
          : Colors.green[200],
    );
  }

  static void showLoading(context){
    showDialog(context: context,barrierDismissible: false,
        builder: (context)=>CustomProgressDialog());
  }

}
