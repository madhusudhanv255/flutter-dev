import 'package:flutter/cupertino.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final Color activeColor;
  final onChanged;

  const AppSwitch({
    Key? key,
    required this.value,
    required this.activeColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: value, activeColor: activeColor, onChanged: onChanged);
  }
}
