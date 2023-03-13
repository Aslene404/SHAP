import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:shap/features/app_navigation/tabs/company_details/widgets/company_details_card_document_widget.dart';
import 'package:shap/features/app_navigation/tabs/company_details/widgets/company_details_card_information_widget.dart';
import 'package:shap/features/app_navigation/tabs/company_details/widgets/company_details_header_widget.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/widgets/search_tab_card_company_widget.dart';
import 'package:shap/features/company_search/presentation/bloc/bloc.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';
import 'package:accordion/accordion.dart';

import '../../../../global/assets/icons.dart';
import '../../../../injection_container.dart';
import '../../../company_search/presentation/bloc/company_search_bloc.dart';
import '../../../company_search/presentation/bloc/company_search_state.dart';
import '../../../company_search/presentation/widgets/company_search_display.dart';
import '../../../company_search/presentation/widgets/loading_widget.dart';
import '../../../company_search/presentation/widgets/message_display.dart';

class CompanyDetailsPage extends StatefulWidget {
  CompanyDetailsPage({Key? key}) : super(key: key);

  @override
  State<CompanyDetailsPage> createState() => _CompanyDetailsPageState();
}

bool isFavorite = true;

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CompanyArguments;
    final c_id = args
        .id; //given company id coming from the selected company in the search page
    final c_number = args
        .number; //given company number coming from the selected company in the the search page
    var widthScreen = MediaQuery.of(context).size.width; //variable screen width
    final _headerStyle = TextStyle(
        color: Color(0xffffffff),
        fontSize: widthScreen > 600 ? 17 : 13,
        fontWeight: FontWeight.bold);
    final _contentStyleHeader = const TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
    final _contentStyle = const TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
    final _loremIpsum =
        '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
    var doc_icons = {
      'Aktueller Abdruck': appleIcon,
      'Chronologischer Abdruck': googleIcon,
      'Historischer Handelsregisterauszug': facebookIcon,
      'Strukturierter Registerinhalt': linkedInIcon,
      'Gesellschaftsvertrag': xingIcon,
      'Liste der Gesellschafter': schild
    }; // icon list for each known company document type
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CompanySearchBloc>(),
        ), //company's details blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_officers>(),
        ), //company's officers blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_contact>(),
        ), //company's contact blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_doc>(),
        ), //company's documents blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_notices>(),
        ), //company's notices blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_insolv>(),
        ), //company's insolvency notices blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_sheets>(),
        ), //company's financial sheets blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_stats>(),
        ), //company's statistics blocProvider
        BlocProvider(
          create: (_) => sl<CompanySearchBloc_branches>(),
        ), //company's branches blocProvider
      ],
      child: Scaffold(
        backgroundColor: greyz,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: isFavorite ? greyLight : red,
                          size: widthScreen > 600 ? 25 : 20,
                        ),
                        onPressed: () =>
                            setState(() => isFavorite = !isFavorite),
                      )
                    ],
                  ),
                ),
                BlocBuilder<CompanySearchBloc, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc>(context).add(
                          CompanyDetailProcess(
                              c_id)); //initiate getting company's details on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");

                      return LoadingWidget();
                    } else if (state is Loaded) {
                      print("loaded");
                      print(state.company);
                      var c_attr = state.company[
                          "all_attributes"]; //getting all attributes from server response
                      if (c_attr["legal_form"] == null) {
                        c_attr["legal_form"] = "null";
                      } //if the company's legal form is not available treat it as "null"
                      String? c_addrFull = state.company[
                          "registered_address"]; // getting the full company's address from the server response
                      String c_addr1 =
                          "Address:"; //initiate the first half of the address to display as "N/A" in case its not available from the server
                      String c_addr2 =
                          "N/A"; //initiate the second half of the address to display as empty
                      // since its redundant to display "N/A" twice in case the address is not available from the server

                      if (c_addrFull != null) {
                        var words = c_addrFull.split(
                            " "); //split the full address into multiple words
                        for (int i = 0; i < words.length; i++) {
                          if (double.tryParse(words[i]) != null &&
                              int.parse(words[i]).toString().length >= 4) {
                            c_addr2 = words[i] + " " + words[i + 1].trim();

                            c_addr1 = c_addrFull
                                .replaceAll(words[i], "")
                                .replaceAll(words[i + 1], "")
                                .trim();
                          } // create the second half of the address composed of the zip code and the city
                          //then using the rest as the first half
                        }
                      }

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: CompanyDetailsHeaderWidget(
                                c_form: c_attr["legal_form"],
                                c_status: state.company["current_status"],
                                c_name: state.company["name"],
                                c_reg: c_attr["registrar"],
                                c_regArt: c_attr["_registerArt"],
                                c_regNum: c_attr["_registerNummer"]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: CompanyDetailsCardInformationWidget(
                                icon: Icons.map,
                                subtitle: c_addr2,
                                title: c_addr1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: CompanyDetailsCardInformationWidget(
                                icon: Icons.balance,
                                subtitle: c_attr["legal_form"] != "null"
                                    ? c_attr["legal_form"]
                                    : "N/A",
                                title: "Rechtsform:"),
                          )
                        ],
                      );
                    } else if (state is Error) {
                      print("error");
                      return MessageDisplay(
                        message: state.message,
                      );
                    }
                    return Container();
                  },
                ),
                BlocBuilder<CompanySearchBloc_officers, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_officers>(context).add(
                          CompanyOfficersProcess(
                              c_number)); //initiate getting company's officers on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");

                      return Container();
                    } else if (state is Loaded) {
                      print("loaded");
                      print(state.company);
                      var officers_len = state.company["officers"].length;
                      if (officers_len == 0) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: CompanyDetailsCardInformationWidget(
                                  icon: Icons.person,
                                  subtitle: "N/A",
                                  title: "Officers:"),
                            ));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: SizedBox(
                            height: widthScreen > 600
                                ? double.parse(officers_len.toString()) * 72
                                : double.parse(officers_len.toString()) * 63,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(0),
                                itemCount: officers_len,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: CompanyDetailsCardInformationWidget(
                                        icon: Icons.person,
                                        subtitle: officers_len != 0 &&
                                                state.company["officers"][index]
                                                        ["name"] !=
                                                    null
                                            ? state.company["officers"][index]
                                                ["name"]
                                            : "N/A",
                                        title: officers_len != 0 &&
                                                state.company["officers"][index]
                                                        ["position"] !=
                                                    null
                                            ? state.company["officers"][index]
                                                ["position"]
                                            : "N/A"),
                                  );
                                }),
                          ),
                        );
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
                BlocBuilder<CompanySearchBloc_branches, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_branches>(context).add(
                          CompanyBranchesProcess(
                              c_number)); //initiate getting company's branches on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");

                      return Container();
                    } else if (state is Loaded) {
                      print("loadedXXXXXXXXXXXXXX");
                      print(state.company);
                      if (state.company.length == 0) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 5),
                          child: CompanyDetailsCardInformationWidget(
                            icon: Icons.factory,
                            subtitle: "N/A",
                            title: "Branche:",
                          ),
                        );
                      }

                      //print(docs[3]["products"][0]["name"]);
                      //print(sub_docs[0]["products"][0]["name"]);
                      else {
                        return SizedBox(
                            height: widthScreen > 600
                                ? double.parse(
                                        state.company.length.toString()) *
                                    72
                                : double.parse(
                                        state.company.length.toString()) *
                                    63,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5),
                                itemCount: state.company.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: CompanyDetailsCardInformationWidget(
                                      icon: Icons.factory,
                                      subtitle: state.company.length != 0
                                          ? state.company[index]
                                          : "N/A",
                                      title: "Branche:",
                                    ),
                                  );
                                }));
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
                BlocBuilder<CompanySearchBloc_contact, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_contact>(context).add(
                          CompanyContactProcess(
                              c_number)); //initiate getting company's contact on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");

                      return Container();
                    } else if (state is Loaded) {
                      print("loaded");
                      print(state.company);

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CompanyDetailsCardInformationWidget(
                                      icon: Icons.phone,
                                      subtitle: state.company["phone_number"] !=
                                                  null &&
                                              state.company["phone_number"] !=
                                                  ""
                                          ? state.company["phone_number"]
                                              .toString()
                                          : "N/A",
                                      title: "Runummer:"),
                                ),
                                Expanded(
                                  child: CompanyDetailsCardInformationWidget(
                                      icon: Icons.mobile_friendly,
                                      subtitle: state.company[
                                                      "mobile_number"] !=
                                                  null &&
                                              state.company["mobile_number"] !=
                                                  ""
                                          ? state.company["mobile_number"]
                                              .toString()
                                          : "N/A",
                                      title: "Mobile:"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: CompanyDetailsCardInformationWidget(
                                icon: Icons.mail,
                                subtitle: state.company["email"] != null &&
                                        state.company["email"] != ""
                                    ? state.company["email"].toString()
                                    : "N/A",
                                title: "E-Mailadresse: "),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: CompanyDetailsCardInformationWidget(
                                icon: Icons.public,
                                subtitle: state.company["website"] != null &&
                                        state.company["website"] != ""
                                    ? state.company["website"].toString()
                                    : "N/A",
                                title: "Webseite: "),
                          ),
                        ],
                      );
                    } else if (state is Error) {
                      print("error");
                      return MessageDisplay(
                        message: state.message,
                      );
                    }
                    return Container();
                  },
                ),
                BlocBuilder<CompanySearchBloc_doc, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_doc>(context).add(
                          CompanyDocumentsProcess(
                              c_id)); //initiate getting company's documents on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");
                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 15,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            headerPadding: EdgeInsets.symmetric(
                                vertical: widthScreen > 600 ? 15 : 10,
                                horizontal: 15),
                            isOpen: false,
                            leftIcon: const Icon(Icons.file_copy,
                                color: Colors.white),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: red,
                            header: Text('DOKUMENTE', style: _headerStyle),
                            content: LoadingWidget(),
                            contentHorizontalPadding: 10,
                            contentBorderWidth: 1,
                            contentBorderColor: const Color(0xffffffff),
                          ),
                        ],
                      );
                    } else if (state is Loaded) {
                      print("loaded_docs");
                      // print(state.company);
                      List<Map<String, dynamic>> docs =
                          []; //list containing all documents except the protocol ones
                      var sub_docs =
                          []; //list containing all the protocol documents

                      state.company["products"].forEach((k, v) {
                        if (k != "Anmeldungen / Protokolle") {
                          docs.add({'name': '${k}', 'products': v});
                        } else {
                          sub_docs = v;
                        }
                      }); //filling both lists

                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 15,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            headerPadding: EdgeInsets.symmetric(
                                vertical: widthScreen > 600 ? 15 : 10,
                                horizontal: 15),
                            isOpen: false,
                            leftIcon: const Icon(Icons.file_copy,
                                color: Colors.white),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: red,
                            header: Text('DOKUMENTE', style: _headerStyle),
                            content: Column(
                              children: [
                                SizedBox(
                                  height: docs.length != 0
                                      ? 69 * docs.length.toDouble()
                                      : 69,
                                  child: docs.length != 0
                                      ? ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: docs.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child:
                                                    CompanyDetailsCardDocumentWidget(
                                                  doc_icon: doc_icons[docs[
                                                                      index]
                                                                  ["products"]
                                                              [0]["category"]
                                                          .toString()
                                                          .trim()] ??
                                                      shNewLogoIcon,
                                                  name: docs[index]["products"]
                                                      [0]["category"],
                                                  price: docs[index]["products"]
                                                          [0]["price"]
                                                      .toString(),
                                                ));
                                          })
                                      : ResponsiveTextWidget(text: "N/A"),
                                ),
                                SizedBox(
                                  height: 69 *
                                      double.parse(sub_docs.length.toString()),
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: sub_docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child:
                                                CompanyDetailsCardDocumentWidget(
                                              doc_icon: filtreIcon,
                                              name: sub_docs[index]["name"],
                                              price: sub_docs[index]["price"]
                                                  .toString(),
                                            ));
                                      }),
                                ),
                                BlocBuilder<CompanySearchBloc_sheets,
                                    CompanySearchState>(
                                  builder: (context, state) {
                                    if (state is Empty) {
                                      print("empty");
                                      BlocProvider.of<CompanySearchBloc_sheets>(
                                              context)
                                          .add(CompanySheetsProcess(
                                              c_id)); //initiate getting company's financial sheets on start up

                                      return MessageDisplay(
                                        message: 'DETAILS',
                                      );
                                    } else if (state is Loading) {
                                      print("loading");

                                      return LoadingWidget();
                                    } else if (state is Loaded) {
                                      print("loaded!!!!!!!!!!!!");
                                      // print(state.company);
                                      List<Map<String, dynamic>> docs = [];
                                      var sub_docs = [];

                                      state.company["products"].forEach((k, v) {
                                        if (k != "Bilanz / Jahresabschluss") {
                                          docs.add(
                                              {'name': '${k}', 'products': v});
                                        } else {
                                          sub_docs = v;
                                        }
                                      });

                                      return SizedBox(
                                        height: sub_docs.length != 0
                                            ? 69 * sub_docs.length.toDouble()
                                            : 69,
                                        child: sub_docs.length != 0
                                            ? ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: sub_docs.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child:
                                                          CompanyDetailsCardDocumentWidget(
                                                        doc_icon: raketeIcon,
                                                        name: sub_docs[index]
                                                            ["name"],
                                                        price: sub_docs[index]
                                                                ["price"]
                                                            .toString(),
                                                      ));
                                                })
                                            : ResponsiveTextWidget(text: "N/A"),
                                      );
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
                            contentHorizontalPadding: 10,
                            contentBorderWidth: 1,
                            contentBorderColor: const Color(0xffffffff),
                          ),
                        ],
                      );
                    } else if (state is Error) {
                      print("error");
                      return MessageDisplay(
                        message: state.message,
                      );
                    }
                    return Container();
                  },
                ),
                BlocBuilder<CompanySearchBloc_notices, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_notices>(context).add(
                          CompanyNoticesProcess(
                              c_number)); //initiate getting company's notices on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");

                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 5,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            contentBorderColor: Colors.white,
                            headerPadding: EdgeInsets.symmetric(
                              vertical: widthScreen > 600 ? 15 : 10,
                              horizontal: 15,
                            ),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: Colors.black38,
                            isOpen: false,
                            leftIcon: const Icon(Icons.info_outline,
                                color: Colors.white),
                            header:
                                Text('BEKANNTMACHUNGEN', style: _headerStyle),
                            content: LoadingWidget(),
                          ),
                        ],
                      );
                    } else if (state is Loaded) {
                      print("loaded");
                      print(state.company);
                      var docs = [];
                      docs = state.company[
                          "notices"]; //list containing the company's notices

                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 5,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            contentBorderColor: Colors.white,
                            headerPadding: EdgeInsets.symmetric(
                              vertical: widthScreen > 600 ? 15 : 10,
                              horizontal: 15,
                            ),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: Colors.black38,
                            isOpen: false,
                            leftIcon: const Icon(Icons.info_outline,
                                color: Colors.white),
                            header:
                                Text('BEKANNTMACHUNGEN', style: _headerStyle),
                            content: SizedBox(
                              height: docs.length != 0
                                  ? 100 * docs.length.toDouble()
                                  : 69,
                              child: docs.length != 0
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Accordion(
                                          paddingListBottom: 10,
                                          disableScrolling: true,
                                          maxOpenSections: 5,
                                          headerBackgroundColorOpened:
                                              Colors.black54,
                                          headerPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 7, horizontal: 15),
                                          children: [
                                            AccordionSection(
                                              headerPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical:
                                                          widthScreen > 600
                                                              ? 15
                                                              : 10,
                                                      horizontal: 15),
                                              isOpen: false,
                                              leftIcon: const Icon(
                                                  Icons.insights_rounded,
                                                  color: Colors.white),
                                              headerBackgroundColor:
                                                  Colors.black54,
                                              headerBackgroundColorOpened:
                                                  Colors.black54,
                                              header: Text(
                                                  docs[index]["notice_type"] +
                                                      " : " +
                                                      docs[index]
                                                          ["publication_date"],
                                                  style: _headerStyle),
                                              content: Text(
                                                  docs[index]["notice_text"],
                                                  style: _contentStyle),
                                              contentHorizontalPadding: 20,
                                              contentBorderColor:
                                                  Colors.black54,
                                            ),
                                          ],
                                        );
                                      })
                                  : ResponsiveTextWidget(text: "N/A"),
                            ),
                          ),
                        ],
                      );
                    } else if (state is Error) {
                      print("error");
                      return MessageDisplay(
                        message: state.message,
                      );
                    }
                    return Container();
                  },
                ),
                BlocBuilder<CompanySearchBloc_insolv, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_insolv>(context).add(
                          CompanyInsolvencyProcess(
                              c_number)); //initiate getting company's insolvency notices on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");
                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 5,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            contentBorderColor: Colors.white,
                            headerPadding: EdgeInsets.symmetric(
                              vertical: widthScreen > 600 ? 15 : 10,
                              horizontal: 15,
                            ),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: Colors.black38,
                            isOpen: false,
                            leftIcon: const Icon(Icons.note_alt_sharp,
                                color: Colors.white),
                            header: Text('INSOLVENZBEKANNTMACHUNGEN',
                                style: _headerStyle),
                            content: LoadingWidget(),
                          ),
                        ],
                      );

                      return Container();
                    } else if (state is Loaded) {
                      print("loaded");
                      print(state.company);
                      var docs = [];
                      docs = state.company[
                          "content"]; //list containing the insolvency notices

                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 5,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            contentBorderColor: Colors.white,
                            headerPadding: EdgeInsets.symmetric(
                              vertical: widthScreen > 600 ? 15 : 10,
                              horizontal: 15,
                            ),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: Colors.black38,
                            isOpen: false,
                            leftIcon: const Icon(Icons.note_alt_sharp,
                                color: Colors.white),
                            header: Text('INSOLVENZBEKANNTMACHUNGEN',
                                style: _headerStyle),
                            content: SizedBox(
                              height: docs.length != 0
                                  ? 200 * docs.length.toDouble()
                                  : 69,
                              child: docs.length != 0
                                  ? ListView.builder(
                                      itemCount: docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Accordion(
                                          paddingListBottom: 10,
                                          disableScrolling: true,
                                          maxOpenSections: 5,
                                          headerBackgroundColorOpened:
                                              Colors.black54,
                                          headerPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 7, horizontal: 15),
                                          children: [
                                            AccordionSection(
                                              headerPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical:
                                                          widthScreen > 600
                                                              ? 15
                                                              : 10,
                                                      horizontal: 15),
                                              isOpen: false,
                                              leftIcon: const Icon(
                                                  Icons.note_alt_sharp,
                                                  color: Colors.white),
                                              headerBackgroundColor:
                                                  Colors.black54,
                                              headerBackgroundColorOpened:
                                                  Colors.black54,
                                              header: Text(
                                                  docs[index]
                                                      ["publication_date"],
                                                  style: _headerStyle),
                                              content: Text(
                                                  docs[index]["notice_text"],
                                                  style: _contentStyle),
                                              contentHorizontalPadding: 20,
                                              contentBorderColor:
                                                  Colors.black54,
                                            ),
                                          ],
                                        );
                                      })
                                  : ResponsiveTextWidget(text: "N/A"),
                            ),
                          ),
                        ],
                      );
                    } else if (state is Error) {
                      print("error");
                      return MessageDisplay(
                        message: state.message,
                      );
                    }
                    return Container();
                  },
                ),
                // BlocBuilder<CompanySearchBloc_sheets, CompanySearchState>(
                //   builder: (context, state) {
                //     if (state is Empty) {
                //       print("empty");
                //       BlocProvider.of<CompanySearchBloc_sheets>(context)
                //           .add(CompanySheetsProcess(c_id));//initiate getting company's financial sheets on start up
                //
                //       return MessageDisplay(
                //         message: 'DETAILS',
                //       );
                //     } else if (state is Loading) {
                //       print("loading");
                //       return Accordion(
                //         disableScrolling: true,
                //         maxOpenSections: 2,
                //         headerBackgroundColorOpened: red,
                //         paddingListBottom: 0,paddingListTop: 5,
                //         openAndCloseAnimation: true,
                //         headerPadding: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         sectionOpeningHapticFeedback:
                //         SectionHapticFeedback.heavy,
                //         sectionClosingHapticFeedback:
                //         SectionHapticFeedback.light,
                //         children: [
                //           AccordionSection(
                //             headerPadding: EdgeInsets.symmetric(
                //                 vertical: widthScreen > 600 ? 15 : 10,
                //                 horizontal: 15),
                //             isOpen: false,
                //             leftIcon:
                //             const Icon(Icons.balance, color: Colors.white),
                //             headerBackgroundColor: Colors.black,
                //             headerBackgroundColorOpened: Colors.amber,
                //             header: Text('JAHRESABSCHLÜSSE & BILANZEN',
                //                 style: _headerStyle),
                //             content: Column(
                //               children: [
                //                 LoadingWidget(),
                //               ],
                //             ),
                //             contentHorizontalPadding: 10,
                //             contentBorderWidth: 1,
                //             contentBorderColor: const Color(0xffffffff),
                //           ),
                //         ],
                //       );
                //
                //       return Container();
                //     } else if (state is Loaded) {
                //       print("loaded!!!!!!!!!!!!");
                //       // print(state.company);
                //       List<Map<String, dynamic>> docs = [];
                //       var sub_docs = [];
                //
                //       state.company["products"].forEach((k, v) {
                //         if (k != "Bilanz / Jahresabschluss") {
                //           docs.add({'name': '${k}', 'products': v});
                //         } else {
                //           sub_docs = v;
                //         }
                //       });
                //
                //       // return Accordion(
                //       //   disableScrolling: true,
                //       //   maxOpenSections: 2,
                //       //   headerBackgroundColorOpened: red,
                //       //   paddingListBottom: 0,paddingListTop: 5,
                //       //   openAndCloseAnimation: true,
                //       //   headerPadding: const EdgeInsets.symmetric(
                //       //       vertical: 10, horizontal: 15),
                //       //   sectionOpeningHapticFeedback:
                //       //       SectionHapticFeedback.heavy,
                //       //   sectionClosingHapticFeedback:
                //       //       SectionHapticFeedback.light,
                //       //   children: [
                //       //     AccordionSection(
                //       //       headerPadding: EdgeInsets.symmetric(
                //       //           vertical: widthScreen > 600 ? 15 : 10,
                //       //           horizontal: 15),
                //       //       isOpen: false,
                //       //       leftIcon:
                //       //           const Icon(Icons.balance, color: Colors.white),
                //       //       headerBackgroundColor: Colors.black,
                //       //       headerBackgroundColorOpened: Colors.amber,
                //       //       header: Text('JAHRESABSCHLÜSSE & BILANZEN',
                //       //           style: _headerStyle),
                //       //       content: Column(
                //       //         children: [
                //       //           SizedBox(
                //       //             height: sub_docs.length != 0
                //       //                 ? 69 * sub_docs.length.toDouble()
                //       //                 : 69,
                //       //             child: sub_docs.length != 0
                //       //                 ? ListView.builder(
                //       //                     physics:
                //       //                         NeverScrollableScrollPhysics(),
                //       //                     itemCount: sub_docs.length,
                //       //                     itemBuilder: (BuildContext context,
                //       //                         int index) {
                //       //                       return Padding(
                //       //                           padding: const EdgeInsets.only(
                //       //                               bottom: 10),
                //       //                           child:
                //       //                               CompanyDetailsCardDocumentWidget(
                //       //                                 doc_icon:  raketeIcon,
                //       //                             name: sub_docs[index]["name"],
                //       //                             price: sub_docs[index]
                //       //                                     ["price"]
                //       //                                 .toString(),
                //       //                           ));
                //       //                     })
                //       //                 : ResponsiveTextWidget(text: "N/A"),
                //       //           ),
                //       //         ],
                //       //       ),
                //       //       contentHorizontalPadding: 10,
                //       //       contentBorderWidth: 1,
                //       //       contentBorderColor: const Color(0xffffffff),
                //       //     ),
                //       //   ],
                //       // );
                //     } else if (state is Error) {
                //       print("error");
                //       return MessageDisplay(
                //         message: state.message,
                //       );
                //     }
                //     return Container();
                //   },
                // ),
                BlocBuilder<CompanySearchBloc_stats, CompanySearchState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      print("empty");
                      BlocProvider.of<CompanySearchBloc_stats>(context).add(
                          CompanyStatsProcess(
                              c_number)); //initiate getting company's statistics on start up

                      return MessageDisplay(
                        message: 'DETAILS',
                      );
                    } else if (state is Loading) {
                      print("loading");
                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 5,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            headerPadding: EdgeInsets.symmetric(
                                vertical: widthScreen > 600 ? 15 : 10,
                                horizontal: 15),
                            isOpen: false,
                            leftIcon:
                                const Icon(Icons.balance, color: Colors.white),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: Colors.amber,
                            header: Text('JAHRESABSCHLÜSSE & BILANZEN',
                                style: _headerStyle),
                            content: Column(
                              children: [
                                LoadingWidget(),
                              ],
                            ),
                            contentHorizontalPadding: 10,
                            contentBorderWidth: 1,
                            contentBorderColor: const Color(0xffffffff),
                          ),
                        ],
                      );

                      return Container();
                    } else if (state is Loaded) {
                      print("loaded!!!!!!!!!!!!");
                      // print(state.company);
                      var labels = [];
                      var data = [];
                      var profitData = [];
                      labels = state.company["labels"];
                      data = state.company["data"];
                      profitData = state.company["profitData"];
                      print("labels:");
                      print(labels);
                      print("data:");
                      print(data);
                      print("profitData:");
                      print(profitData);

                      return Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerBackgroundColorOpened: red,
                        paddingListBottom: 0,
                        paddingListTop: 5,
                        openAndCloseAnimation: true,
                        headerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        sectionOpeningHapticFeedback:
                            SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback:
                            SectionHapticFeedback.light,
                        children: [
                          AccordionSection(
                            headerPadding: EdgeInsets.symmetric(
                                vertical: widthScreen > 600 ? 15 : 10,
                                horizontal: 15),
                            isOpen: false,
                            leftIcon:
                                const Icon(Icons.balance, color: Colors.white),
                            headerBackgroundColor: Colors.black,
                            headerBackgroundColorOpened: Colors.amber,
                            header: Text('JAHRESABSCHLÜSSE & BILANZEN',
                                style: _headerStyle),
                            content: Column(
                              children: [
                                SizedBox(
                                  height: 90,
                                  child: Echarts(
                                    option: '''
    {
      xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'bar'
      }]
    }
  ''',
                                  ),
                                ),
                              ],
                            ),
                            contentHorizontalPadding: 10,
                            contentBorderWidth: 1,
                            contentBorderColor: const Color(0xffffffff),
                          ),
                        ],
                      );

                      //print(docs[3]["products"][0]["name"]);
                      //print(sub_docs[0]["products"][0]["name"]);

                      return Container();
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
          ),
        ),
      ),
    );
  }
}
