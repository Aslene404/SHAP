import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/widgets/search_tab_card_company_widget.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/widgets/search_tab_text_form_field_widget.dart';


import 'package:shap/features/company_search/presentation/bloc/bloc.dart';
import 'package:shap/features/company_search/presentation/widgets/message_display.dart';
import 'package:shap/global/assets/icons.dart';

import '../../../../../global/common_widgets/reponsive_text_widget.dart';
import '../../../../../global/theme/themes.dart';
import '../../../../register/presentation/widgets/loading_widget.dart';
import '../../../../company_search/data/models/company_model.dart';
import '../../../../company_search/presentation/widgets/company_search_display.dart';

class CompanySearchControls extends StatefulWidget {
  const CompanySearchControls({
    Key? key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<CompanySearchControls> {
  // validate search text
  String? validateData({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Postleitzahl ein";
    }
    return null;
  }

  String? onchangeData({required TextEditingController controller}) {
    BlocProvider.of<CompanySearchBloc>(context)
        .add(CompanySearchProcess(controller.text, form_filter, bundesland_filter, branches_filter, kapital_filter, plz_filter));//get company's search results from server
    // when the user is done editing the text field
    return null;
  }


  final _searchTextController = TextEditingController();
  List<Map<String,String>> bundeslands= [
  { "label": "Baden-Württemberg", "value": '"Baden-Württemberg"' },
  { "label": "Berlin", "value": '"Berlin"' },
  { "label": "Bremen", "value": '"Bremen"' },
  { "label": "Hessen", "value": '"Hessen"' },
  { "label": "Bayern", "value": '"Bayern"' },
  { "label": "Brandenburg", "value": '"Brandenburg"' },
  { "label": "Hamburg", "value": '"Hamburg"' },
  { "label": "Mecklenburg-Vorp", "value": '"Mecklenburg-Vorp"' },
  { "label": "Niedersachsen", "value": '"Niedersachsen"' },
  { "label": "Rheinland-Pfalz", "value": '"Rheinland-Pfalz"' },
  { "label": "Sachsen", "value": '"Sachsen"' },
  { "label": "Schleswig-Holstein", "value": '"Schleswig-Holstein"' },
  { "label": "Nordrhein-Westf", "value": '"Nordrhein-Westf"' },
  { "label": "Saarland", "value": '"Saarland"' },
  { "label": "Sachsen-Anhalt", "value": '"Sachsen-Anhalt"' },
  { "label": "Thüringen", "value": '"Thüringen"' },];
  List<Map<String,String>> legal_forms= [
    { "label": "Stiftung & Co. KGaA", "value": '"Stiftung & Co. KGaA"' },
    { "label": "Stiftung & Co. KG", "value": '"Stiftung & Co. KG"' },
    { "label": "Stiftung GmbH & Co. KG", "value": '"Stiftung GmbH & Co. KG"' },
    { "label": "SE & Co. KGaA", "value": '"SE & Co. KGaA"' },
    { "label": "GmbH & Co. KGaA", "value": '"GmbH & Co. KGaA"' },
    { "label": "GmbH & Co. KG", "value": '"GmbH & Co. KG"' },
    { "label": "GmbH & Co. OHG", "value": '"GmbH & Co. OHG"' },
    { "label": "GmbH", "value": '"GmbH"' },
    { "label": "AG & Co. KGaA", "value": '"AG & Co. KGaA"' },
    { "label": "AG & Co. KG", "value": '"AG & Co. KG"' },
    { "label": "AG & Co. OHG", "value": '"AG & Co. OHG"' },
    { "label": "REIT-AG", "value": '"REIT-AG"' },
    { "label": "InvAG", "value": '"InvAG"' },
    { "label": "VVaG", "value": '"VVaG"' },
    { "label": "gAG", "value": '"gAG"' },
    { "label": "AG", "value": '"AG"' },
    { "label": "Limited & Co. KG", "value": '"Limited & Co. KG"' },
    { "label": "UG (haftungsbeschränkt) & Co. KG", "value": '"UG (haftungsbeschränkt) & Co. KG"' },
    { "label": "UG (haftungsbeschränkt)", "value": '"UG (haftungsbeschränkt)"' },
    { "label": "KGaA", "value": '"KGaA"' },
    { "label": "KG", "value": '"KG"' },
    { "label": "OHG", "value": '"OHG"' },
    { "label": "GbR", "value": '"GbR"' },
    { "label": "PartG mbB", "value": '"PartG mbB"' },
    { "label": "PartG", "value": '"PartG"' },
    { "label": "AöR", "value": '"AöR"' },
    { "label": "eg", "value": '"eg"' },
    { "label": "e.K.", "value": '"e.K."' },
    { "label": "e.V.", "value": '"e.V."' },
    { "label": "KdöR", "value": '"KdöR"' },
    { "label": "EWIV", "value": '"EWIV"' },
    { "label": "SE", "value": '"SE"' },
    { "label": "SCE", "value": '"SCE"' },
    ];
  List<Map<String,String>> branches= [

    { "label": "Land- und Forstwirtschaft, Fischerei", "value": '"Land- und Forstwirtschaft, Fischerei"' },
    { "label": "Bergbau und Gewinnung von Steinen und Erden", "value": '"Bergbau und Gewinnung von Steinen und Erden"' },
    { "label": "Verarbeitendes Gewerbe", "value": '"Verarbeitendes Gewerbe"' },
    { "label": "Energieversorgung", "value": '"Energieversorgung"' },
    { "label": "Wasserversorgung; Abwasser- und Abfallentsorgung und Beseitigung von Umweltverschmutzungen", "value": '"Wasserversorgung; Abwasser- und Abfallentsorgung und Beseitigung von Umweltverschmutzungen"' },
    { "label": "Baugewerbe", "value": '"Baugewerbe"' },
    { "label": "Handel; Instandhaltung und Reparatur von Kraftfahrzeugen", "value": '"Handel; Instandhaltung und Reparatur von Kraftfahrzeugen"' },
    { "label": "Verkehr und Lagerei", "value": '"Verkehr und Lagerei"' },
    { "label": "Gastgewerbe", "value": '"Gastgewerbe"' },
    { "label": "Information und Kommunikation", "value": '"Information und Kommunikation"' },
    { "label": "Erbringung von Finanz- und Versicherungsdienstleistungen", "value": '"Erbringung von Finanz- und Versicherungsdienstleistungen"' },
    { "label": "Grundstücks- und Wohnungswesen", "value": '"Grundstücks- und Wohnungswesen"' },
    { "label": "Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen", "value": '"Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen"' },
    { "label": "Erbringung von sonstigen wirtschaftlichen Dienstleistungen", "value": '"Erbringung von sonstigen wirtschaftlichen Dienstleistungen"' },
    { "label": "Öffentliche Verwaltung, Verteidigung; Sozialversicherung", "value": '"Öffentliche Verwaltung, Verteidigung; Sozialversicherung"' },
    { "label": "Erziehung und Unterricht", "value": '"Erziehung und Unterricht"' },
    { "label": "Gesundheits- und Sozialwesen", "value": '"Gesundheits- und Sozialwesen"' },
    { "label": "Kunst, Unterhaltung und Erholung", "value": '"Kunst, Unterhaltung und Erholung"' },
    { "label": "Erbringung von sonstigen Dienstleistungen", "value": '"Erbringung von sonstigen Dienstleistungen"' },
    { "label": "Private Haushalte mit Hauspersonal; Herstellung von Waren und Erbringung von Dienstleistungen durch private Haushalte für den Eigenbedarf ohne ausgeprägten Schwerpunkt", "value": '"Private Haushalte mit Hauspersonal; Herstellung von Waren und Erbringung von Dienstleistungen durch private Haushalte für den Eigenbedarf ohne ausgeprägten Schwerpunkt"' },
    { "label": "Exterritoriale Organisationen und Körperschaften", "value": '"Exterritoriale Organisationen und Körperschaften"' },
    ];
  String bundesland_filter='[]';
  String plz_filter="";
  String form_filter='[]';
  String kapital_filter="";
  String branches_filter='[]';
  var bundesland_filter_list=[];
  List<Object?> form_filter_list=[];
  List<Object?> branches_filter_list=[];


  @override
  void dispose() {
    super.dispose();
  }

  static List<String> _kOptions = <String>[];//list of suggestions used for auto complete
  var res_length = "0";//length of the server result
  var results;
  final Map<String, dynamic> mapById = {};//map containing each company and its id
  final Map<String, dynamic> mapByNumber = {};//map containing each company and its number

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: widthScreen > 600
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width:
                    widthScreen > 600 ? widthScreen * 0.5 : widthScreen * 0.75,
                child: SearchTabTextFormFieldWidget(

                  hint: "UNTERNEHMEN SUCHEN",
                  controller: _searchTextController,
                  validateData: validateData,
                  onchange: onchangeData,
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          height: 120,
                          child: Card(
                            margin: EdgeInsets.zero,
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.my_location_outlined,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _showDialog_bundesland(context);

                                          },
                                          color: red,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: ResponsiveTextWidget(
                                          text: 'Bundesland',
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.map,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _showDialog_plz(context);

                                          },
                                          color: red,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: ResponsiveTextWidget(
                                          text: 'PLZ',
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.balance,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _showDialog_legal_form(context);
                                          },
                                          color: red,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: ResponsiveTextWidget(
                                          text: 'Rechtsform',
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.euro,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _showDialog_capital(context);
                                          },
                                          color: red,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: ResponsiveTextWidget(
                                          text: 'Kapital',
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.factory,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _showDialog_branches(context);
                                          },
                                          color: red,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: ResponsiveTextWidget(
                                          text: 'Branche',
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Image.asset(filtreIcon,),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: plz_filter==''?0:60,
              child: SizedBox(
                height: widthScreen > 600 ? 60 : 40,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: plz_filter!=''?1:0,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: widthScreen > 600 ? 50 : 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.map,
                                    color: red,
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: ResponsiveTextWidget(
                                        text: plz_filter,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                         Positioned(
                           left: 60,
                          top: 0,
                          bottom: 30,
                          right: 0,
                          child: IconButton(

                            icon: Icon(Icons.cancel),
                            iconSize: 15,
                            color: red,
                            onPressed: (){
                              plz_filter='';
                              setState(() {
                                BlocProvider.of<CompanySearchBloc>(context)
                                    .add(CompanySearchProcess(_searchTextController.text, form_filter, bundesland_filter, branches_filter, kapital_filter, plz_filter));

                              });
                            },

                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: kapital_filter==''?0:60,
              child: SizedBox(
                height: widthScreen > 600 ? 60 : 40,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: kapital_filter!=''?1:0,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: widthScreen > 600 ? 50 : 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.euro,
                                    color: red,
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: ResponsiveTextWidget(
                                        text: kapital_filter,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 0,
                          bottom: 30,
                          right: 0,
                          child: IconButton(

                            icon: Icon(Icons.cancel),
                            iconSize: 15,
                            color: red,
                            onPressed: (){
                              kapital_filter='';
                              setState(() {
                                BlocProvider.of<CompanySearchBloc>(context)
                                    .add(CompanySearchProcess(_searchTextController.text, form_filter, bundesland_filter, branches_filter, kapital_filter, plz_filter));

                              });
                            },

                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: bundesland_filter_list.length==0?0:60,
              child: SizedBox(
                height: widthScreen > 600 ? 60 : 40,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: bundesland_filter_list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: widthScreen > 600 ? 50 : 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.my_location_outlined,
                                    color: red,
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: ResponsiveTextWidget(
                                        text: bundesland_filter_list[index].toString().replaceAll('"',''),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 0,
                          bottom: 30,
                          right: 0,
                          child: IconButton(

                            icon: Icon(Icons.cancel),
                            iconSize: 15,
                            color: red,
                            onPressed: (){
                              bundesland_filter_list.removeAt(index);
                              setState(() {
                                BlocProvider.of<CompanySearchBloc>(context)
                                    .add(CompanySearchProcess(_searchTextController.text, form_filter, bundesland_filter, branches_filter, kapital_filter, plz_filter));

                              });
                            },

                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: form_filter_list.length==0?0:60,
              child: SizedBox(
                height: widthScreen > 600 ? 60 : 40,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: form_filter_list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: widthScreen > 600 ? 50 : 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.balance,
                                    color: red,
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: ResponsiveTextWidget(
                                        text: form_filter_list[index].toString().replaceAll('"',''),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 0,
                          bottom: 30,
                          right: 0,
                          child: IconButton(

                            icon: Icon(Icons.cancel),
                            iconSize: 15,
                            color: red,
                            onPressed: (){
                              form_filter_list.removeAt(index);
                              setState(() {
                                BlocProvider.of<CompanySearchBloc>(context)
                                    .add(CompanySearchProcess(_searchTextController.text, form_filter, bundesland_filter, branches_filter, kapital_filter, plz_filter));

                              });
                            },

                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: branches_filter_list.length==0?0:60,
              child: SizedBox(
                height: widthScreen > 600 ? 60 : 40,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: branches_filter_list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: widthScreen > 600 ? 50 : 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.factory,
                                    color: red,
                                    size: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: ResponsiveTextWidget(
                                        text: branches_filter_list[index].toString().replaceAll('"',''),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 0,
                          bottom: 30,
                          right: 0,
                          child: IconButton(

                            icon: Icon(Icons.cancel),
                            iconSize: 15,
                            color: red,
                            onPressed: (){
                              branches_filter_list.removeAt(index);
                              setState(() {
                                BlocProvider.of<CompanySearchBloc>(context)
                                    .add(CompanySearchProcess(_searchTextController.text, form_filter, bundesland_filter, branches_filter, kapital_filter, plz_filter));

                              });
                            },

                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          const Divider(
            color: greyDark,
          ),
          BlocBuilder<CompanySearchBloc, CompanySearchState>(
            builder: (context, state) {
              if (state is Empty) {
                return Container();
              } else if (state is Loading) {
                return Center(child: LoadingWidget());
              } else if (state is Loaded) {
                print("loaded");
                print(state.company);
                if (state.company["companies"] != null) {
                  _kOptions.clear();//resetting the suggestions list

                  for (int i = 0; i < state.company["companies"].length; i++) {
                    var temp_id =
                        state.company['companies'][i]['_id'].toString();//saving the current company's id
                    mapById[temp_id] =
                        state.company["companies"][i]["name"].toString();//mapping each company to its id
                    var temp_number = state.company['companies'][i]
                            ['company_number']
                        .toString();//saving the current company's number
                    mapByNumber[temp_number] =
                        state.company["companies"][i]["name"].toString();//mapping each company to its number


                    _kOptions
                        .add(state.company["companies"][i]["name"].toString());//adding the found company name to the suggestions list
                  }
                  res_length = _kOptions.length.toString();//saving the suggestions list's length
                  results = state.company["companies"];//saving all the results

                  // return CompanySearchDisplay(res: _kOptions);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: ResponsiveTextWidget(
                          text: "Ihre Suche ergab $res_length Treffer",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: _kOptions.length,
                            itemBuilder: (context, index) {
                              return SearchTabCardCompanyWidget(
                                c_id: results[index]["_id"].toString(),
                                c_number:
                                    results[index]["company_number"].toString(),
                                c_name: results[index]["name"].toString(),
                                c_addrFull: results[index]["registered_address"]
                                    .toString(),
                                c_capital: results[index]["capital"].toString(),
                                c_form: results[index]["all_attributes"]
                                        ["legal_form"]
                                    .toString(),
                                c_status:
                                    results[index]["current_status"].toString(),
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  // return CompanySearchDisplay(res: state.company);
                }
              } else if (state is Error) {
                print("error");
                return MessageDisplay(
                  message: state.message,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
  Future<void> _showDialog_bundesland(BuildContext context) async {
    final theme = Theme.of(context);
    final _items = bundeslands
        .map((bundesland) => MultiSelectItem(bundesland["value"], bundesland["label"].toString()))
        .toList();
    await showDialog(

        context: context,
        builder: (ctx) {
      return  MultiSelectDialog(
        title: Text("Bundesland",style:theme.textTheme.headline4 ,),
        backgroundColor: Colors.white,
        items: _items,
        initialValue: [],
        onConfirm: (values) {
          bundesland_filter_list=values;
         
          bundesland_filter=values.toString();
          print(bundesland_filter);
          setState(() {

          });



          },
      );
    },
    );
  }
  Future<void> _showDialog_plz(BuildContext context) async {
    final theme = Theme.of(context);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('PLZ'),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                plz_filter=value;
                print(plz_filter);
                setState(() {


                });


              },


              decoration: InputDecoration(hintText: "PLZ"),
            ),
          );
        });
  }
  Future<void> _showDialog_legal_form(BuildContext context) async {
    final theme = Theme.of(context);
    final _items = legal_forms
        .map((legal_forms) => MultiSelectItem(legal_forms["value"], legal_forms["label"].toString()))
        .toList();
    await showDialog(

      context: context,
      builder: (ctx) {
        return  MultiSelectDialog(
          title: Text("Rechtsform",style:theme.textTheme.headline4 ,),
          backgroundColor: Colors.white,
          items: _items,
          initialValue: [],
          onConfirm: (values) {
            form_filter_list=values;
            form_filter=values.toString();
            print(form_filter);
            setState(() {

            });



          },
        );
      },
    );
  }
  Future<void> _showDialog_capital(BuildContext context) async {
    final theme = Theme.of(context);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Kapital'),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                kapital_filter=value;
                print(kapital_filter);
                setState(() {

                });

              },

              decoration: InputDecoration(hintText: "Kapital",suffix:Icon(Icons.euro) ),
            ),
          );
        });
  }
  Future<void> _showDialog_branches(BuildContext context) async {
    final theme = Theme.of(context);
    final _items = branches
        .map((branches) => MultiSelectItem(branches["value"], branches["label"].toString()))
        .toList();
    await showDialog(

      context: context,
      builder: (ctx) {
        return  MultiSelectDialog(
          title: Text("Branche",style:theme.textTheme.headline4 ,),
          backgroundColor: Colors.white,
          items: _items,
          initialValue: [],
          onConfirm: (values) {
            branches_filter_list=values;
            branches_filter=values.toString();
            print(branches_filter);
            setState(() {

            });



          },
        );
      },
    );
  }
}
