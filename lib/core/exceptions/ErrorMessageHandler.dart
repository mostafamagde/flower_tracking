import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/erorr_data.dart';
import 'exceptions_impl.dart';

// دالة معالجة الخطأ
String handleErrorMessage(Exception? ex, BuildContext context) {
  String message = "";
  if (ex is ServerError) {
    message = ex.errorModel?.message ?? "Server error occurred";
  } else if (ex is ClientError) {
    message = ex.errorModel?.message ?? "Please login again";
  } else if (ex is NetworkError) {
    message = ex.message ?? "Network error";
  } else {
    message = "An unexpected error occurred";
  }
  return message;
}

// مكان استدعاء الدالة عند وقوع الخطأ:
void handleError(Exception? ex, BuildContext context) {
  String errorMessage = handleErrorMessage(ex, context);
  print("Error message: $errorMessage");  // يمكن طباعة الرسالة على الconsole

  // يمكنك إظهار الرسالة للمستخدم هنا باستخدام طريقة مثل:
  showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text('Error'),
      content: Text(errorMessage),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
