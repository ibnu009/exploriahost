import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

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

void showFailedDialog({required BuildContext context, required String title, required String message, VoidCallback? onTap}) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: title,
    text: message,
    loopAnimation: false,
    onConfirmBtnTap: onTap
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

void showYesNoDialog(BuildContext context, String title, String message,
    Function() onYesTap, Function() onNoTap) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: onYesTap,
          child: const Text('Iya'),
        ),
        TextButton(
          onPressed: onNoTap,
          child: const Text('Tidak'),
        ),
      ],
    ),
  );
}