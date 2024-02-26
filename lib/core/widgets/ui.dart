

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum MessageType { error, success, warning }

class UIAlert {

  static void showAlert(context, {message, type}) {
    Toastification().show(
      context: context,
      title: Text(message ?? "",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      style: ToastificationStyle.fillColored,
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
      backgroundColor: type == MessageType.error
          ? Colors.redAccent
          : type == MessageType.success
          ? Colors.green[200]
          : type == MessageType.warning
          ? Colors.amber
          : Colors.green[200],
    );
  }

}
