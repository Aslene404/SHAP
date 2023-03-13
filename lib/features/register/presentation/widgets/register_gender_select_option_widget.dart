import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../global/translation/generated/locale_keys.g.dart';
import '../enums/user_gender.dart';

class RegisterGenderSelectOptionWidget extends StatefulWidget {
  final UserGender? gender;
  final Function changeGender;

  const RegisterGenderSelectOptionWidget(
      {Key? key, required this.changeGender, required this.gender})
      : super(key: key);

  @override
  _RegisterGenderSelectOptionWidgetState createState() =>
      _RegisterGenderSelectOptionWidgetState();
}

class _RegisterGenderSelectOptionWidgetState
    extends State<RegisterGenderSelectOptionWidget> {
  late FixedExtentScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _scrollController = FixedExtentScrollController(
        initialItem: UserGender.values.indexOf(UserGender.male));

    Widget _buildItemPicker() {
      return SizedBox(
        height: 150,
        child: CupertinoPicker(
            itemExtent: 50.0,
            scrollController: FixedExtentScrollController(
                initialItem: UserGender.values.indexOf(UserGender.male)),
            onSelectedItemChanged: (index) {
              widget.changeGender(UserGender.values[index]);
            },
            children: [
              ...UserGender.values.map(
                (e) => Center(
                  child: Text(
                    e.title,
                    style: theme.textTheme.headline4,
                  ),
                ),
              )
            ]),
      );
    }

    return (kIsWeb || Platform.isAndroid)
        ? Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    value: widget.gender,
                    isExpanded: true,
                    validator: (value) => value == null ? '' : null,
                    decoration: InputDecoration(
                      helperText: '',
                      helperStyle: const TextStyle(height: 0.2),
                      contentPadding: const EdgeInsets.only(
                          bottom: 13, top: 13, right: 20, left: 48),
                      hintText: "Bitte Wahlen",
                      errorStyle: const TextStyle(height: 0.2),
                      hintStyle: theme.textTheme.headline4,
                    ),
                    dropdownColor: theme.dividerColor,
                    focusColor: Colors.white,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 25,
                      color: theme.highlightColor,
                    ),
                    onChanged: (UserGender? newValue) {
                      if (newValue != null) {
                        widget.changeGender(
                          newValue,
                        );
                      }
                    },
                    items: UserGender.values
                        .map<DropdownMenuItem<UserGender>>((UserGender values) {
                      return DropdownMenuItem<UserGender>(
                        value: values,
                        child: Text(
                          values.title,
                          style: theme.textTheme.headline4,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Positioned(
                top: 15,
                left: 25,
                child: Icon(
                  Icons.male,
                  size: 20.0,
                  color: Color.fromARGB(255, 3, 12, 63),
                ),
              ),
            ],
          )
        : SizedBox(
            height: 60,
            child: GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    actions: [_buildItemPicker()],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text(
                        "Bitte Wählen",
                        style: theme.textTheme.headline4?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (widget.gender != null)
                              ? widget.gender!.title
                              : "Bitte Wahlen",
                          style: theme.textTheme.headline4,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: theme.highlightColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
