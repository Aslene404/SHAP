import 'package:flutter/material.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

class CompanyDetailsCardInformationWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const CompanyDetailsCardInformationWidget(
      {Key? key,
      required this.icon,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(icon, size: 22, color: red),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveTextWidget(
                    text: title,
                    fontWeight: FontWeight.w600,
                  ),
                  ResponsiveTextWidget(
                    text: subtitle,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
