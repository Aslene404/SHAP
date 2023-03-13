import 'package:flutter/material.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ResponsiveTextWidget extends StatefulWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  ResponsiveTextWidget(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight,
      this.maxLines,
      this.fontSize})
      : super(key: key);

  @override
  _ResponsiveTextWidgetState createState() => _ResponsiveTextWidgetState();
}

class _ResponsiveTextWidgetState extends State<ResponsiveTextWidget> {
  String? firstHalf;
  String? secondHalf;
  GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 20) {
      firstHalf = widget.text;
      secondHalf = widget.text.substring(20, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;

    return AutoSizeText(
      widget.text,
      maxLines: widget.maxLines ?? 1,
      style: theme.textTheme.headline4?.copyWith(
          fontSize: widthScreen > 600 ? 20 : widget.fontSize ?? 13,
          color: widget.color,
          fontWeight: widget.fontWeight),
      minFontSize: 14,
      overflowReplacement: Row(
        // This widget will be replaced.
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: Text(
              firstHalf ?? "",
              maxLines: widget.maxLines ?? 1,
              style: theme.textTheme.headline4?.copyWith(
                  fontSize: widthScreen > 600 ? 20 : widget.fontSize ?? 13,
                  color: widget.color,
                  fontWeight: widget.fontWeight),
            ),
          ),
          InkWell(
            key: Key("show_more_ink_well"),
            child: Text(
              " ...",
              key: key,
              style: theme.textTheme.headline4
                  ?.copyWith(fontSize: widget.fontSize ?? 13),
            ),
            onTap: () {
              showMoreText(widget.text);
            },
          ),
        ],
      ),
    );
  }

  void showMoreText(String text) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;

    ShowMoreTextPopup popup = ShowMoreTextPopup(
      context,
      text: text,
      textStyle: TextStyle(
        color: theme.highlightColor,
        fontSize: widthScreen > 600 ? 16 : 13,
        fontWeight: FontWeight.w500,
      ),
      height: 200,
      width: 250,
      backgroundColor: theme.dividerColor,
      padding: const EdgeInsets.all(10.0),
      borderRadius: BorderRadius.circular(10.0),
    );

    /// show the popup for specific widget
    popup.show(
      widgetKey: key,
    );
  }
}
