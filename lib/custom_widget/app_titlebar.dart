import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoNavigationBar appTitleBar(
  context,
  leading,
  middle,
) {
  return CupertinoNavigationBar(
    //leading:  ,
    middle: Text(
      middle,
      selectionColor: Color.fromARGB(255, 226, 230, 233),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: CupertinoDynamicColor.withBrightnessAndContrast(
            color: CupertinoTheme.of(context).primaryColor,
            darkColor: CupertinoColors.systemGrey,
            highContrastColor: CupertinoColors.lightBackgroundGray,
            darkHighContrastColor: CupertinoColors.destructiveRed),
      ),
    ),
  );
}
