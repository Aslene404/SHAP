import 'package:flutter/material.dart';
import 'package:shap/app_routes.dart';
import 'package:shap/features/app_navigation/tabs/company_details/company_details_page.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

class CompanyArguments {
  final String id;
  final String number;

  CompanyArguments(this.id, this.number);
}

class SearchTabCardCompanyWidget extends StatelessWidget {
  final String? c_name;//company's name
  final String? c_capital;//company's capital
  final String? c_addrFull;//company's full address
  final String? c_number;//company's number
  final String? c_id;//company's id

  final String? c_status;//company's status
  final String? c_form;//company's legal form
  const SearchTabCardCompanyWidget({
    Key? key,
    this.c_name,
    this.c_capital,
    this.c_addrFull,
    this.c_status,
    this.c_form,
    this.c_number,
    this.c_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? c_trueForm = c_form;
    var color;
    //mapping each legal form to a specific color
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
    String c_addr1 = "";//initiate the first half of the address to display as empty
    String c_addr2 = "";//initiate the second half of the address to display as empty

    var words = c_addrFull!.split(" ");//split the full address into multiple words
    for (int i = 0; i < words.length; i++) {
      if (double.tryParse(words[i]) != null &&
          int.parse(words[i]).toString().length >= 4) {
        c_addr2 = words[i] + " " + words[i + 1].trim();

        c_addr1 = c_addrFull!
            .replaceAll(words[i], "")
            .replaceAll(words[i + 1], "")
            .trim();
      }
    }// create the second half of the address composed of the zip code and the city
    //then using the rest as the first half
    var widthScreen = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    var heightScreen = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompanyDetailsPage(),
          // Pass the arguments as part of the RouteSettings. The
          // DetailScreen reads the arguments from these settings.
          settings: RouteSettings(
            arguments: CompanyArguments(
                c_id.toString().trim(), c_number.toString().trim()),
          ),
        ),
      ),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              height: widthScreen > 600 ? 100 : 80,
              width: widthScreen * 0.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                color: color,
              ),
              child: Center(
                child: ResponsiveTextWidget(
                  text: c_trueForm != "null"
                      ? c_trueForm!.split(" ")[0].toString()
                      : "N/A",
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                height: widthScreen > 600 ? 100 : 80,
                width:
                    widthScreen > 600 ? widthScreen * 0.75 : widthScreen * 0.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ResponsiveTextWidget(
                          text: c_name != "null" ? "$c_name" : "N/A",
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ResponsiveTextWidget(
                          text: c_addr1,
                          color: grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ResponsiveTextWidget(
                              text: c_addr2,
                              color: grey,
                            ),
                          ),
                          Expanded(
                            child: ResponsiveTextWidget(
                              text: c_status != "null" ? "($c_status)" : "N/A",
                              color: c_status == "currently registered"
                                  ? green
                                  : red,
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
