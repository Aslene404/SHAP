import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shap/global/theme/themes.dart';

class SearchTabTextFormFieldWidget extends StatelessWidget {
  final void Function(String)? onSubmit;

  final String hint;
  final TextEditingController controller;
  final Function validateData;
  final Function? onchange;

  const SearchTabTextFormFieldWidget({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validateData,
    this.onSubmit,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;

    return TextFormField(
      style: theme.textTheme.headline4?.copyWith(color: blueSofort),
      maxLines: 1,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: widthScreen > 600 ? 24 : 18,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.clear_sharp,
            size: widthScreen > 600 ? 24 : 18,
          ),
          onPressed: () {
            controller.clear();
          },
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: black,
            width: 1.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: greyDark,
            width: 1.0,
          ),
        ),
        errorStyle: const TextStyle(height: 0.2),
        labelStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 12,
        ),
        hintStyle: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : 12,
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
        ),
      ),
      controller: controller,
      onEditingComplete: () => onchange!(controller: controller),
      validator: (_) => validateData(controller: controller),
      keyboardType: TextInputType.text,
      onFieldSubmitted: onSubmit,
    );
  }
}
