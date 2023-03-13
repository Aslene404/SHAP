import 'package:flutter/material.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

import '../../../../../global/assets/icons.dart';

class CompanyDetailsCardDocumentWidget extends StatefulWidget {
  final String? name;
  final String? price;
  final String? doc_icon;
  CompanyDetailsCardDocumentWidget({Key? key, this.name, this.price, required this.doc_icon}) : super(key: key);

  @override
  State<CompanyDetailsCardDocumentWidget> createState() =>
      _CompanyDetailsCardDocumentWidgetState();
}

class _CompanyDetailsCardDocumentWidgetState
    extends State<CompanyDetailsCardDocumentWidget> {
  bool isCheck = true;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name=widget.name;
    final price=widget.price;
    final doc_icon=widget.doc_icon;

    return Card(
      color: greyz,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(doc_icon!,height: 15,)
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ResponsiveTextWidget(
                        text: "$name",
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ResponsiveTextWidget(
                    text: "$price £",
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ElevatedButton(
                    onPressed: () => setState(() => isCheck = !isCheck),
                    child: Icon(
                      Icons.shopping_cart,
                      color: isCheck ? red : Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      primary: isCheck ? Colors.white : red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
