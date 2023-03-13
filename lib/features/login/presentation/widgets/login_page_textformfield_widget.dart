import 'package:flutter/material.dart';

import '../../../../global/theme/themes.dart';

class LoginPageTextFormFieldWidget extends StatelessWidget {
  final void Function(String)? onSubmit;

  final String hint;
  final TextEditingController controller;
  final Function validateData;
  final IconData leadingIcon;
  final bool obscureText;

  const LoginPageTextFormFieldWidget({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validateData,
    required this.leadingIcon,
    required this.obscureText,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;

    return TextFormField(
      style: theme.textTheme.headline4?.copyWith(color: blueSofort),
      maxLines: 1,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: greyDark,
            width: 3.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorStyle: const TextStyle(height: 0.2),
        labelStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 13,
        ),
        hintStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 13,
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      controller: controller,
      validator: (_) => validateData(controller: controller),
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      onFieldSubmitted: onSubmit,
    );
  }
}
