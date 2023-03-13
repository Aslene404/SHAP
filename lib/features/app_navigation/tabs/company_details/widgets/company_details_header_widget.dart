import 'package:flutter/material.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

class CompanyDetailsHeaderWidget extends StatelessWidget {
  final String? c_name;
  final String? c_regArt;
  final String? c_regNum;
  final String? c_reg;
  final String? c_form;
  final String? c_status;
  const CompanyDetailsHeaderWidget(
      {Key? key,
      this.c_name,
      this.c_regArt,
      this.c_regNum,
      this.c_reg,
      this.c_form,
      this.c_status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? c_trueForm = c_form;
    var color;
    if (c_form!.startsWith("Stiftung")) {
      color = purple;
    }
    if (c_form!.startsWith("SE")) {
      color = pink;
    }
    if (c_form!.startsWith("GmbH") || c_form == ("gGmbH")) {
      c_trueForm = "GmbH";
      color = blueSchwingum;
    }
    if (c_form!.toLowerCase().startsWith("ag") ||
        c_form!.toLowerCase().endsWith("ag")) {
      color = amber;
    }
    if (c_form!.startsWith("Limited") || c_form!.startsWith("UG")) {
      color = orange;
    }
    if (c_form!.startsWith("KG") ||
        c_form!.startsWith("OHG") ||
        c_form!.startsWith("GbR") ||
        c_form!.startsWith("PartG")) {
      color = brown;
    }
    if (c_form!.startsWith("AöR") ||
        c_form!.toLowerCase().startsWith("e") ||
        c_form!.startsWith("KdöR") ||
        c_form == "SE" ||
        c_form == "SCE") {
      color = blueGrey;
    }
    if (c_form == "null") {
      color = Colors.black;
    }

    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: widthScreen > 600 ? 80 : 60,
              height: widthScreen > 600 ? 80 : 60,
              child: Center(
                child: ResponsiveTextWidget(
                  text: c_trueForm != "null"
                      ? c_trueForm!.split(" ")[0].toString()
                      : "N/A",
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: widthScreen * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveTextWidget(
                      text: "$c_name",
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: ResponsiveTextWidget(
                        text: c_reg != "null" ||
                                c_reg != "null" ||
                                c_reg != "null"
                            ? "$c_regArt $c_regNum - $c_reg"
                            : "N/A",
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    ResponsiveTextWidget(
                      text: c_status != "null" ? "($c_status)" : "(N/A)",
                      color: c_status == "currently registered" ? green : red,
                      fontSize: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
