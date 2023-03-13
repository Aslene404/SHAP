import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/features/register/presentation/bloc/bloc.dart';
import 'package:shap/features/register/presentation/widgets/register_controls.dart';
import 'package:shap/global/assets/icons.dart';
import '../../../../app_routes.dart';
import '../../../../injection_container.dart';
import '../../../company_search/presentation/widgets/loading_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  BlocProvider<RegisterBloc> build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return BlocProvider(
      create: (_) => sl<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
  listener: (context, state) {
    if (state is Error) {
      print("Error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.red,
        ),
      );
    }
    if (state is Loading) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: LoadingWidget(),
          backgroundColor: Colors.blue,
        ),
      );
    }
    if (state is Loaded) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Register Success"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(
        context,
        loginPage,
      );
    }
  },
  child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(shNewLogoIcon),
                  RegisterControls(),
                ],
              ),
            ),
          ),
        ),
      ),
),
    );
  }
}
