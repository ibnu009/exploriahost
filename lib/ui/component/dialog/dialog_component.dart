import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';


void showSuccessDialog({required BuildContext context, required String title, required String message, VoidCallback? onTap}) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    title: title,
    text: message,
    confirmBtnText: "Ok",
    loopAnimation: false,
    barrierDismissible: false,
    onConfirmBtnTap: onTap
  );
}

void showLoadingDialog({required BuildContext context}) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.loading,
  );
}

void showFailedDialog({required BuildContext context, required String title, required String message}) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: title,
    text: message,
    loopAnimation: false,
  );
}

void showOkDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Ok'),
        ),
      ],
    ),
  );
}