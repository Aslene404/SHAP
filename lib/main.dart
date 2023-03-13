import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shap/features/company_search/presentation/widgets/company_search_page.dart';
import 'app_routes.dart' as route;
import 'global/theme/themes.dart';
import 'global/translation/generated/codegen_loader.g.dart';
import 'global/translation/supported_language.dart';
import 'injection_container.dart' as di;

class MyHttpOverrides extends HttpOverrides {
  // Cerificate configuration
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.init();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale(describeEnum(SupportedLanguageEasyLocalization.nl)),
        Locale(describeEnum(SupportedLanguageEasyLocalization.en)),
      ],
      fallbackLocale:
          Locale(describeEnum(SupportedLanguageEasyLocalization.nl)),
      assetLoader: const CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: route.landingPage,
        onGenerateRoute: route.controller,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: lightTheme);
  }
}
