import 'package:flutter/cupertino.dart';

class AppSlider extends StatelessWidget {
  final double value;
  final int divisions;
  final double max;
  final Color activeColor;
  final Color thumbColor;
  final onChanged;

  const AppSlider({
    Key? key,
    required this.value,
    required this.divisions,
    required this.max,
    required this.activeColor,
    required this.thumbColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: CupertinoSlider(
            key: const Key('slider'),
            value: value,
            divisions: divisions,
            max: max,
            activeColor: activeColor,
            thumbColor: thumbColor,
            onChanged: onChanged));
  }
}
