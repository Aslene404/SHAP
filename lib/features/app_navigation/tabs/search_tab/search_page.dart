import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/widgets/company_search_controls_2.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/widgets/search_tab_card_company_widget.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/widgets/search_tab_text_form_field_widget.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

import '../../../../injection_container.dart';
import '../../../company_search/presentation/bloc/company_search_bloc.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // validate search text
  String? validateData({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Postleitzahl ein";
    }
    return null;
  }

  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CompanySearchBloc>(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CompanySearchControls(),
        ),
      ),
    );
  }
}
