import 'package:flutter/material.dart';
import 'package:shap/features/app_navigation/tabs/article_tab/widgets/article_cart_shop_widget.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ResponsiveTextWidget(text: "IHR WARENKORB"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ResponsiveTextWidget(
                  text: "(3 ARTIKEL)",
                  color: red,
                ),
              ),
              SizedBox(
                height: 110 * 3,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ArticleCartShopWidget();
                  },
                ),
              ),
              Card(
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResponsiveTextWidget(
                            text: "GESAMTBETRAG",
                          ),
                          ResponsiveTextWidget(
                            text: "14,90 €",
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResponsiveTextWidget(
                              text: "TVA",
                            ),
                            ResponsiveTextWidget(
                              text: "2,90 €",
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 0,
                        indent: 0,
                        endIndent: 0,
                        color: grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResponsiveTextWidget(
                            text: "GESAMTBETRAG",
                          ),
                          ResponsiveTextWidget(
                            text: "14,90 €",
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 15, left: 15),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ResponsiveTextWidget(
                                    text: "WEITER ZUR ZAHLUNG",
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  primary: red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
