import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shap/features/company_search/presentation/bloc/bloc.dart';
import 'package:shap/features/company_search/presentation/widgets/message_display.dart';

import '../../../register/presentation/widgets/loading_widget.dart';
import '../../data/models/company_model.dart';
import 'company_search_display.dart';

class CompanySearchControls extends StatefulWidget {
  const CompanySearchControls({
    Key? key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<CompanySearchControls> {
  final email_controller =
      TextEditingController(); //email input field controller
  final password_controller =
      TextEditingController(); //password input field controller
  late String inputemail; // inputted email string
  late String inputpassword; // inputted password string
  late CompanyModel company; // initiated company info
  String? xing_first_name; // obtained xing's company first name from widget
  String? xing_last_name; // obtained xing's company last name from widget
  String? xing_email; // obtained xing's company email from widget
  static List<String> _kOptions = <String>[];
  final Map<String, dynamic> mapById = {};
  final Map<String, dynamic> mapByNumber = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CompanySearchBloc, CompanySearchState>(
          builder: (context, state) {
            if (state is Empty) {
              print("empty");
              return MessageDisplay(
                message: 'SEARCH',
              );
            } else if (state is Loading) {
              print("loading");

              return LoadingWidget();
            } else if (state is Loaded) {
              print("loaded");
              print(state.company);
              if (state.company["companies"] != null) {
                _kOptions.clear();

                for (int i = 0; i < state.company["companies"].length; i++) {
                  var temp_id = state.company['companies'][i]['_id'].toString();
                  mapById[temp_id] =
                      state.company["companies"][i]["name"].toString();
                  var temp_number = state.company['companies'][i]
                          ['company_number']
                      .toString();
                  mapByNumber[temp_number] =
                      state.company["companies"][i]["name"].toString();
                  // print("!!!!!!!!!!!!!!!!! !!!!!!!!!!!!!!!!!!!!!!!!");
                  // print(mapByNumber[temp_number]);

                  _kOptions
                      .add(state.company["companies"][i]["name"].toString());
                }

                return CompanySearchDisplay(res: _kOptions);
              } else {
                return CompanySearchDisplay(res: state.company);
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
        Autocomplete<String>(
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
            return TextField(
              decoration: InputDecoration(
                  suffixText: (fieldTextEditingController.text.isNotEmpty)
                      ? "Tap to refresh suggestions"
                      : ""),
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text != "") {
              print(textEditingValue.text);
              BlocProvider.of<CompanySearchBloc>(context).add(
                  CompanySearchProcess(
                      textEditingValue.text, '"GmbH"', '', '', '', ''));
            }
            print(_kOptions);
            setState(() {});

            return _kOptions;
          },
          onSelected: (String selection) {
            debugPrint('You just selected $selection');
            var selectedId = mapById.keys.firstWhere(
                (k) => mapById[k] == selection,
                orElse: () => "null");

            var selectedNumber = mapByNumber.keys.firstWhere(
                (k) => mapByNumber[k] == selection,
                orElse: () => "null");
            // print("???????????????????? $selectedNumber ??????????????");
            BlocProvider.of<CompanySearchBloc>(context)
                .add(CompanySheetsProcess(selectedId));
          },
        ),
      ],
    );
  }
}
