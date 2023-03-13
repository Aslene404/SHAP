// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "test_one": "testt",
  "intro_page": {
    "login": "log in",
    "getting_started": "Getting started",
    "search_for_comapnies": "Search for companies...",
    "app_description": "Know with whom you are doing business",
    "sofort_name": "SOFORT",
    "register_commercial": "HANDELSREGISTER"
  },
  "login_page": {
    "login_hint": "LOG IN",
    "email": "E-mail",
    "enter_email": "Please enter email",
    "invalid_password": "invalid password",
    "invalid_email": "Invalid e-mail address",
    "password": "Password",
    "forget_password": "Forgot Password?",
    "without_account_yet": "No customer account yet?",
    "join_now": "Join Now.",
    "sign_in": "SIGN IN",
    "or": "OR"
  },
  "register_page": {},
  "enums": {
    "gender": {
      "mrs": "Mrs.",
      "mr": "Mr."
    },
    "title": {
      "doctor": "Dr.",
      "professor": "Prof."
    },
    "user_gender": {
      "female": "Mrs.",
      "male": "Mr."
    }
  }
};
static const Map<String,dynamic> nl = {
  "test_one": "tesyy",
  "intro_page": {
    "login": "Einloggen",
    "getting_started": "Loslegen",
    "search_for_comapnies": "Unternehmen suchen...",
    "app_description": "Wissen mit wem Sie Geschäfte machen",
    "sofort_name": "SOFORT",
    "register_commercial": "HANDELSREGISTER"
  },
  "login_page": {
    "login_hint": "LOGIN",
    "email": "E-mail",
    "enter_email": "Bitte E-Mail eingeben",
    "invalid_password": "ungültige passwort",
    "invalid_email": "ungültige E-Mail-Adresse",
    "password": "Passwort ",
    "forget_password": "Passwort vergessen?",
    "without_account_yet": "Noch kein Kundenkonto?",
    "join_now": "Jetzt registrieren.",
    "sign_in": "ANMELDEN",
    "or": "ODER"
  },
  "register_page": {},
  "enums": {
    "gender": {
      "mrs": "Frau",
      "mr": "Herr"
    },
    "title": {
      "doctor": "Dr.",
      "professor": "Prof."
    },
    "user_gender": {
      "female": "Frau",
      "male": "Herr"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "nl": nl};
}
