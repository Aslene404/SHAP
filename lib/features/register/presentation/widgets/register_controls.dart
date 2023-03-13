import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/app_routes.dart';
import 'package:shap/features/register/presentation/widgets/register_gender_select_option_widget.dart';
import 'package:shap/features/register/presentation/widgets/register_password_textformfield_widget.dart';
import 'package:shap/features/register/presentation/widgets/register_textformfield_widget.dart';
import 'package:shap/features/register/presentation/widgets/register_title_select_option_widget.dart';
import 'package:shap/features/register/presentation/widgets/widgets.dart';
import 'package:shap/features/register/presentation/bloc/bloc.dart';
import 'package:shap/global/assets/icons.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/common_widgets/resize_text_widget.dart';
import 'package:shap/global/theme/themes.dart';

import '../enums/user_gender.dart';
import '../enums/user_title.dart';

class RegisterControls extends StatefulWidget {
  const RegisterControls({
    Key? key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<RegisterControls> {
  // validate password input
  String? _validatePassword({required TextEditingController controller}) {
    return (controller.text.isNotEmpty && controller.text.length >= 6)
        ? null
        : "Bitte geben Passwort ein";
  }

// validate email input
  String? _validateEmailTextField({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Mailadresse ein";
    } else if ((!EmailValidator.validate(controller.text))) {
      return "Bitte geben Sie eine gültige E-Mailadresse ein";
    }
    return null;
  }

// validate Phone Number
  String? _validatePhoneNumber({required TextEditingController controller}) {
    return null;
  }

  // validate Company
  String? _validateCompany({required TextEditingController controller}) {
    return null;
  }

  // validate ustid
  String? _validateUstid({required TextEditingController controller}) {
    return null;
  }

  // validate fisrt name
  String? _validateFirstName({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Sie Ihren Vornamen ein";
    }
    return null;
  }

  // validate last name
  String? _validateLastName({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Sie Ihren Nachnamen ein";
    }
    return null;
  }

  // validate Street
  String? _validateStreet({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben straße ein";
    }
    return null;
  }

  // validate House Number
  String? _validateHouseNumber({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Hausnummer ein";
    }
    return null;
  }

  // validate City
  String? _validateCity({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Stadt ein";
    }
    return null;
  }

  // validate Postal Code
  String? _validatePostalCode({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return "Bitte geben Postleitzahl ein";
    }
    return null;
  }

// gender selection
  UserGender? _userGender;
  void _changeUserGender(UserGender? userGender) => setState(() {
        _userGender = userGender;
      });
// title selection
  UserTitle? _userTitle;
  void _changeUserTitle(UserTitle? userTitle) => setState(() {
        _userTitle = userTitle;
      });
// controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _companyController = TextEditingController();
  final _ustidController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerifyController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool agbIsChecked = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneNumberController.dispose();
    _lastNameController.dispose();
    _streetController.dispose();
    _companyController.dispose();
    _ustidController.dispose();
    _postalCodeController.dispose();
    _cityController.dispose();
    _houseNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordVerifyController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  late String inputsalutation;
  late String inputtitle;
  late String inputfirstname;
  late String inputlasttname;
  late String inputemail;
  late String inputpassword;
  late String inputphonenumber;
  late String inputcompany;
  late String inputustid;
  late String inputstreet;
  late String inputhousenumber;
  late String inputzipcode;
  late String inputcity;
  late String inputagb;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveTextWidget(
            text: "Erstellen Sie ein kostenloses ",
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ResponsiveTextWidget(
              text: " Konto und profitieren Sie von ",
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          ResponsiveTextWidget(
            text: " noch mehr Daten.",
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ResponsiveTextWidget(
              text: "Jetzt anmelden",
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ResponsiveTextWidget(
                      text: "Vorname",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: RegisterTextformfieldwidget(
                    leadingIcon: Icons.person,
                    hint: "Vorname",
                    controller: _firstNameController,
                    validateData: _validateFirstName,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ResponsiveTextWidget(
                      text: "Nachname",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: RegisterTextformfieldwidget(
                    leadingIcon: Icons.person,
                    hint: "Nachname",
                    controller: _lastNameController,
                    validateData: _validateLastName,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ResponsiveTextWidget(
                      text: "E-mail",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: RegisterTextformfieldwidget(
                    leadingIcon: Icons.email,
                    hint: "E-mail",
                    controller: _emailController,
                    validateData: _validateEmailTextField,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ResponsiveTextWidget(
                      text: "Passwort",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: RegisterPasswordTextformfieldwidget(
                      leadingIcon: Icons.lock,
                      hint: "Passwort",
                      controller: _passwordController,
                      validateData: _validatePassword),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ResponsiveTextWidget(
                      text: "Passwort wiederholen",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: RegisterPasswordTextformfieldwidget(
                      leadingIcon: Icons.lock,
                      hint: "Passwort wiederholen",
                      controller: _passwordVerifyController,
                      validateData: _validatePassword),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthScreen * 0.07, vertical: 5),
            child: CheckboxListTile(
              value: agbIsChecked,
              onChanged: (bool? value) {
                setState(() {
                  agbIsChecked = value!;
                });
              },
              activeColor: theme.highlightColor,
              title: ResponsiveTextWidget(
                text: "Ich habe die AGBs gelesen, verstanden und akzeptiert.",
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                ),
                backgroundColor: MaterialStateProperty.all(black),
              ),
              onPressed: () {
                if (agbIsChecked == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please accept AGB ')),
                  );
                } else {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.blue,content: Text('Processing Data')),
                    );
                    inputsalutation = "N/A";
                    inputtitle = "N/A";
                    inputfirstname = _firstNameController.text;
                    inputlasttname = _lastNameController.text;
                    inputstreet = "N/A";
                    inputzipcode = "N/A";
                    inputhousenumber = "N/A";
                    inputcity = "N/A";
                    inputemail = _emailController.text;
                    inputcompany = "N/A";
                    inputustid = "N/A";
                    inputagb = agbIsChecked.toString();

                    inputpassword = _passwordController.text;
                    inputphonenumber = _phoneNumberController.text;
                    print(inputemail);
                    print(inputpassword);
                    dispatchConcrete();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('fill the required item')),
                    );
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: ResponsiveTextWidget(
                  text: "Registrieren",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveTextWidget(
                    text: "Already have an account ?",
                  ),
                  InkWell(
                    child: ResponsiveTextWidget(
                      text: " Sign in",
                      color: Colors.red,
                    ),
                    onTap: () => Navigator.pushNamed(context, loginPage),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchConcrete() {
    print(inputemail);
    BlocProvider.of<RegisterBloc>(context).add(RegisterProcess(
        inputsalutation,
        inputtitle,
        inputfirstname,
        inputlasttname,
        inputemail,
        inputpassword,
        inputphonenumber,
        inputcompany,
        inputustid,
        inputstreet,
        inputhousenumber,
        inputzipcode,
        inputcity,
        inputagb));
  }
}
