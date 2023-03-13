import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/features/company_search/presentation/widgets/loading_widget.dart';
import 'package:shap/features/login/presentation/widgets/login_controls.dart';
import '../../../../app_routes.dart';
import '../../../../global/assets/icons.dart';
import '../../../../injection_container.dart';
import '../../data/models/user_model.dart';
import '../bloc/bloc.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String inputemail; // inputted email string
  late String inputpassword; // inputted password string
  late UserModel user; // initiated user info
  String? xing_first_name; // obtained xing's user first name from widget
  String? xing_last_name; // obtained xing's user last name from widget
  String? xing_email; // obtained xing's user email from widget

// validate email input

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
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
          content: Text("Login Success"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(
        context,
        landingPage,
      );
    }
  },
  child: Scaffold(body: SafeArea(child: LoginControls())),
),
    );
  }
}
