import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/features/company_search/presentation/widgets/company_search_controls.dart';

import '../../../../injection_container.dart';
import '../../../login/presentation/widgets/loading_widget.dart';
import '../../../login/presentation/widgets/message_display.dart';
import '../bloc/bloc.dart';
import 'company_search_display.dart';

class CompanySearchPage extends StatelessWidget {
  const CompanySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => sl<CompanySearchBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Example"),),
        body: Column(
          children: [

            CompanySearchControls(),
          ],
        ),
      ),
    );
  }
}
