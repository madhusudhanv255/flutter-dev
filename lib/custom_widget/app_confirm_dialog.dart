import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final String button1;
  final String button2;
  final String linkButton;
  final onPressed1;
  final onPressed2;
  Color? buttonColor;
  Color? buttonTextColor;

  AppConfirmDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.button1,
    required this.button2,
    required this.linkButton,
    required this.onPressed1,
    required this.onPressed2,
    this.buttonColor,
    this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: showDialog(context));
  }

  showDialog(context) {
    buttonColor = buttonColor ?? const Color.fromARGB(255, 202, 116, 217);
    buttonTextColor = buttonTextColor ?? Colors.white;
    return CupertinoButton(
      color: buttonColor,
      onPressed: () => showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              /// This parameter indicates this action is the default,
              /// and turns the action's text to bold text.
              isDefaultAction: true,
              onPressed: onPressed1,
              child: Text(button1),
            ),
            CupertinoDialogAction(
              /// This paraßmeter indicates the action would perform
              /// a destructive action such as deletion, and turns
              /// the action's text color to red.
              isDestructiveAction: true,
              onPressed: onPressed2,
              child: Text(button2,style: TextStyle(color: button2 == 'Delete'?Colors.red:Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ),
      child: Text(
        linkButton,
        style: TextStyle(color: buttonTextColor),
      ),
    );
  }
}
