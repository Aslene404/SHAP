import 'package:flutter/material.dart';
import 'package:shap/global/theme/themes.dart';

class RegisterTextformfieldwidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function validateData;
  final TextInputType? textInputType;
  final IconData leadingIcon;
  const RegisterTextformfieldwidget(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.validateData,
      required this.leadingIcon,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;

    return TextFormField(
      keyboardType: textInputType,
      style: theme.textTheme.headline4,
      maxLines: 1,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
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
        errorStyle: const TextStyle(height: 0.2),
        helperStyle: const TextStyle(height: 0.2),
        helperText: '',
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        filled: true,
        labelStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 13,
        ),
        hintStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 13,
        ),
        hintText: hint,
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(bottom: 5),
        //   child: Icon(
        //     leadingIcon,
        //     color: Color.fromARGB(255, 3, 12, 63),
        //     size: 20,
        //   ),
        // ),
      ),
      controller: controller,
      validator: (_) => validateData(controller: controller),
    );
  }
}
