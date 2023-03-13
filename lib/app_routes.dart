import 'package:flutter/material.dart';
import 'package:shap/features/app_navigation/pr%C3%A9sentation/app_navigation.dart';
import 'package:shap/features/app_navigation/tabs/company_details/company_details_page.dart';
import 'package:shap/features/home/presentation/intro_page.dart';
import 'package:shap/features/login/presentation/pages/login_page.dart';
import 'package:shap/features/register/presentation/pages/register_page.dart';

const String loginPage = 'loginPage';
const String registerPage = 'registerPage';
const String landingPage = 'landingPage';
const String searchPage = 'searchPage';
const String companyDetails = 'companyDetails';

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case landingPage:
      return MaterialPageRoute(builder: (context) => IntroPageNew());
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case searchPage:
      return MaterialPageRoute(builder: (context) => AppNavigationPage());
    case companyDetails:
      return MaterialPageRoute(builder: (context) => CompanyDetailsPage());
    default:
      throw ('this route name does not exist');
  }
}
