import 'package:flutter/material.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

class ArticleCartShopWidget extends StatelessWidget {
  const ArticleCartShopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthScreen,
      height: 110,
      child: Card(
        color: Colors.white,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveTextWidget(text: "ANMELDUNG VOM 09.06.2020"),
                  Icon(
                    Icons.delete,
                    color: red,
                  )
                ],
              ),
              Row(
                children: [
                  ResponsiveTextWidget(
                    text: "Unternehmen :",
                    fontWeight: FontWeight.w600,
                  ),
                  ResponsiveTextWidget(text: "Collingwood Lighting Ltd."),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ResponsiveTextWidget(
                          text: "Kategorie :",
                          fontWeight: FontWeight.w600,
                        ),
                        ResponsiveTextWidget(
                          text: "Anmeldungen / Protokolle",
                        ),
                      ],
                    ),
                    ResponsiveTextWidget(
                      text: "14,90 €",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
