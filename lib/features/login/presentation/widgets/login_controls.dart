import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:shap/core/error/exception.dart';
import 'package:shap/features/login/data/datasources/login_local_data_source.dart';
import 'package:shap/features/login/presentation/bloc/bloc.dart';
import 'package:shap/features/login/presentation/widgets/login_password_textformfield_widget.dart';
import 'package:shap/features/login/presentation/widgets/message_display.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/theme/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../../../app_routes.dart';
import '../../../../global/assets/icons.dart';
import '../../../../global/translation/generated/locale_keys.g.dart';
import '../../../register/presentation/widgets/loading_widget.dart';
import '../../data/models/user_model.dart';
import 'login_display.dart';
import 'login_page_textformfield_widget.dart';

class LoginControls extends StatefulWidget {
  const LoginControls({
    Key? key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<LoginControls> {
  final _formKey = GlobalKey<FormState>();

  final email_controller =
      TextEditingController(); //email input field controller
  final password_controller =
      TextEditingController(); //password input field controller
  late String inputemail; // inputted email string
  late String inputpassword; // inputted password string

  String? xing_first_name; // obtained xing's user first name from widget
  String? xing_last_name; // obtained xing's user last name from widget
  String? xing_email; // obtained xing's user email from widget

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 0, bottom: 10),
                child: Image.asset(
                  shNewLogoIcon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 0, bottom: 10),
                child: ResponsiveTextWidget(
                  text: LocaleKeys.login_page_login_hint.tr(),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widthScreen * 0.1,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: ResponsiveTextWidget(
                          text: LocaleKeys.login_page_email.tr(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: LoginPageTextFormFieldWidget(
                        obscureText: false,
                        leadingIcon: Icons.email,
                        hint: LocaleKeys.login_page_email.tr(),
                        controller: email_controller,
                        validateData: _validateEmailTextField,
                        onSubmit: (value) {
                          inputemail = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widthScreen * 0.1,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ResponsiveTextWidget(
                          text: LocaleKeys.login_page_password.tr(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: LoginPasswordTextformfieldwidget(
                        leadingIcon: Icons.lock,
                        hint: LocaleKeys.login_page_password.tr(),
                        controller: password_controller,
                        validateData: _validatePassword,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.1, vertical: 5),
                  child: ResponsiveTextWidget(
                    text: LocaleKeys.login_page_forget_password.tr(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
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
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.blue,
                        content: Text('Processing Data'),
                      ),
                    );
                    inputemail = email_controller.text;
                    inputpassword = password_controller.text;

                    dispatchConcrete();

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('fill the required item'),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: ResponsiveTextWidget(
                    text: LocaleKeys.login_page_sign_in.tr(),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(),
                      ),
                    ),
                    ResponsiveTextWidget(
                      text: LocaleKeys.login_page_or.tr(),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: red,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width:
                          isLandscape ? widthScreen * 0.3 : widthScreen * 0.33,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: dispatchConcrete_google,
                            highlightColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(googleIcon),
                                ),
                                ResponsiveTextWidget(
                                  text: "Google",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width:
                          isLandscape ? widthScreen * 0.3 : widthScreen * 0.33,
                      child: Card(
                        elevation: 2,
                        color: blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              dispatchConcrete_facebook();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute<void>(
                              //         builder: (final BuildContext context) =>
                              //             LinkedInUserWidget(
                              //                 redirectUrl:
                              //                     "http://localhost.com/",
                              //                 clientId:
                              //                     "78elfqdodpa7zy", //client id of linked in developer  account
                              //                 clientSecret:
                              //                     "8fpXJXmCSpUADDK4", //client code of linkedin developer account
                              //                 projection: const [
                              //                   ProjectionParameters.id,
                              //                   ProjectionParameters
                              //                       .localizedFirstName,
                              //                   ProjectionParameters
                              //                       .localizedLastName,
                              //                   ProjectionParameters.firstName,
                              //                   ProjectionParameters.lastName,
                              //                   ProjectionParameters
                              //                       .profilePicture,
                              //                 ],
                              //                 onError:
                              //                     (final UserFailedAction e) {
                              //                   print('Error: ${e.toString()}');
                              //                   print(
                              //                       'Error: ${e.stackTrace.toString()}');
                              //                   throw ServerExeption(
                              //                       message: e.toString());
                              //                 },
                              //                 onGetUserProfile:
                              //                     (final UserSucceededAction
                              //                         linkedInUser) {
                              //                   dispatchConcrete_linked_in(
                              //                       linkedInUser);
                              //                 })));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(facebookIcon),
                                ),
                                Flexible(
                                  child: ResponsiveTextWidget(
                                    text: "Facebook",
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width:
                          isLandscape ? widthScreen * 0.3 : widthScreen * 0.33,
                      child: Card(
                        elevation: 2,
                        color: Colors.grey,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (final BuildContext context) =>
                                          LinkedInUserWidget(
                                              redirectUrl:
                                                  "http://localhost.com/",
                                              clientId:
                                                  "78elfqdodpa7zy", //client id of linked in developer  account
                                              clientSecret:
                                                  "8fpXJXmCSpUADDK4", //client code of linkedin developer account
                                              projection: const [
                                                ProjectionParameters.id,
                                                ProjectionParameters
                                                    .localizedFirstName,
                                                ProjectionParameters
                                                    .localizedLastName,
                                                ProjectionParameters.firstName,
                                                ProjectionParameters.lastName,
                                                ProjectionParameters
                                                    .profilePicture,
                                              ],
                                              onError:
                                                  (final UserFailedAction e) {
                                                print('Error: ${e.toString()}');
                                                print(
                                                    'Error: ${e.stackTrace.toString()}');
                                                throw ServerExeption(
                                                    message: e.toString());
                                              },
                                              onGetUserProfile:
                                                  (final UserSucceededAction
                                                      linkedInUser) {
                                                dispatchConcrete_linked_in(
                                                    linkedInUser);
                                              })));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(linkedInIcon),
                                ),
                                Flexible(
                                  child: ResponsiveTextWidget(
                                    text: "LinkedIn",
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       _buildLogoButton(
              //         image: facebookIcon,
              //         onPressed: dispatchConcrete_facebook,
              //         heroTag: "btn1",
              //       ),
              //       _buildLogoButton(
              //         image: googleIcon,
              //         onPressed: dispatchConcrete_google,
              //         heroTag: "btn2",
              //       ),
              //       _buildLogoButton(
              //         image: linkedInIcon,
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute<void>(
              //                   builder: (final BuildContext context) =>
              //                       LinkedInUserWidget(
              //                           redirectUrl: "http://localhost.com/",
              //                           clientId:
              //                               "78elfqdodpa7zy", //client id of linked in developer  account
              //                           clientSecret:
              //                               "8fpXJXmCSpUADDK4", //client code of linkedin developer account
              //                           projection: const [
              //                             ProjectionParameters.id,
              //                             ProjectionParameters
              //                                 .localizedFirstName,
              //                             ProjectionParameters
              //                                 .localizedLastName,
              //                             ProjectionParameters.firstName,
              //                             ProjectionParameters.lastName,
              //                             ProjectionParameters.profilePicture,
              //                           ],
              //                           onError: (final UserFailedAction e) {
              //                             print('Error: ${e.toString()}');
              //                             print(
              //                                 'Error: ${e.stackTrace.toString()}');
              //                             throw ServerExeption(
              //                                 message: e.toString());
              //                           },
              //                           onGetUserProfile:
              //                               (final UserSucceededAction
              //                                   linkedInUser) {
              //                             dispatchConcrete_linked_in(
              //                                 linkedInUser);
              //                           })));
              //         },
              //         heroTag: "btn3",
              //       ),
              //       _buildLogoButton(
              //         image: xingIcon,
              //         onPressed: () {},
              //         heroTag: "btn4",
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.login_page_without_account_yet.tr(),
                      style: theme.textTheme.headline5
                          ?.copyWith(color: Colors.black),
                    ),
                    InkWell(
                      child: Text(LocaleKeys.login_page_join_now.tr(),
                          style: theme.textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                      onTap: () => Navigator.pushNamed(
                        context,
                        registerPage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispatchConcrete() {
    print(inputemail);
    BlocProvider.of<LoginBloc>(context)
        .add(LoginProcess(inputemail, inputpassword));
    // Navigator.pushNamed(
    //   context,
    //   landingPage,
    // );
  }

  void dispatchConcrete_google() {
    BlocProvider.of<LoginBloc>(context).add(LoginGoogleProcess());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('Login Google Initiated '),
      ),
    );


  }

  void dispatchConcrete_facebook() {
    BlocProvider.of<LoginBloc>(context).add(LoginFacebookProcess());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('Login Facebook Initiated '),
      ),
    );

  }

  void dispatchConcrete_linked_in(UserSucceededAction linkedInUser) async {
    print(
      'Access token ${linkedInUser.user.token.accessToken}',
    );

    print('User id: ${linkedInUser.user.userId}');

    String? first_name = linkedInUser.user.firstName!.localized!.label;
    String? last_name = linkedInUser.user.lastName!.localized!.label;
    String? email =
        linkedInUser.user.email!.elements![0].handleDeep!.emailAddress;
    BlocProvider.of<LoginBloc>(context)
        .add(LoginLinkedInProcess(first_name!, last_name!, email!));

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('Login LinkedIn Initiated '),
      ),
    );

  }

  String? _validatePassword({required TextEditingController controller}) {
    return (controller.text.isNotEmpty && controller.text.length >= 6)
        ? null
        : LocaleKeys.login_page_invalid_password.tr();
  }

// validate email input
  String? _validateEmailTextField({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      return LocaleKeys.login_page_enter_email.tr();
    } else if ((!EmailValidator.validate(controller.text))) {
      return LocaleKeys.login_page_invalid_email.tr();
    }
    return null;
  }

  Widget _buildLogoButton({
    required String image,
    required String heroTag,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 45,
      width: 45,
      child: FloatingActionButton(
        elevation: 3,
        heroTag: Text(heroTag),
        backgroundColor: Colors.white,
        onPressed: onPressed,
        child: SizedBox(
          height: 30,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
