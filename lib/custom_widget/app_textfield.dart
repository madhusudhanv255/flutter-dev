import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final Icon? icon;
  final String? placeholder;

  const AppTextField(
      {Key? key,
      this.controller ,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.placeholder,
      @required this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.icon,
      this.onEditingCompleted,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      
      child: CupertinoTextFormFieldRow(
        prefix: prefix,
          onChanged: onChanged,
          onEditingComplete: onEditingCompleted,
          autofocus: autofocus,
          minLines: isMulti ? 4 : 1,
          maxLines: isMulti ? null : 1,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: obsecure,
          keyboardType: keyboardType,
          controller: controller,
          placeholder: placeholder,
          // decoration: InputDecoration(
          //   errorText: errorText,
          //   prefixIcon: prefix,
          //   suffixIcon: suffix,
          //   labelStyle: TextStyle(fontSize: lableFontSize()),
          //   labelText: label,
          //   hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
          //   contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   enabledBorder: textFieldfocused(),
          //   border: textFieldfocused(),
          //   focusedBorder: textFieldfocused(),
          //   errorBorder: errorrTextFieldBorder(),
          //   focusedErrorBorder: errorrTextFieldBorder(),
          // ),
          validator: validator),
    );
  }
}