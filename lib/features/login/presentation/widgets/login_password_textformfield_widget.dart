import 'package:flutter/material.dart';
import 'package:shap/global/theme/themes.dart';

class LoginPasswordTextformfieldwidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Function validateData;
  final TextInputType? textInputType;
  final IconData leadingIcon;

  const LoginPasswordTextformfieldwidget({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validateData,
    required this.leadingIcon,
    this.textInputType,
  }) : super(key: key);

  @override
  State<LoginPasswordTextformfieldwidget> createState() =>
      _LoginPasswordTextformfieldwidgetState();
}

class _LoginPasswordTextformfieldwidgetState
    extends State<LoginPasswordTextformfieldwidget> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;

    return TextFormField(
      keyboardType: widget.textInputType,
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
        helperText: '',
        helperStyle: const TextStyle(height: 0.2),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        filled: true,
        hintText: widget.hint,
        labelStyle: theme.textTheme.headline4,
        hintStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 13,
        ),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(bottom: 5),
        //   child: Icon(
        //     widget.leadingIcon,
        //     color: Color.fromARGB(255, 3, 12, 63),
        //     size: 20,
        //   ),
        // ),
        suffixIcon: IconButton(
          onPressed: _toggle,
          color: theme.highlightColor,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.remove_red_eye,
            size: 17,
          ),
        ),
      ),
      obscureText: _obscureText,
      controller: widget.controller,
      validator: (_) => widget.validateData(controller: widget.controller),
    );
  }
}
