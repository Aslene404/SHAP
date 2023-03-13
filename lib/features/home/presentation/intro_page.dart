import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shap/app_routes.dart';
import 'package:shap/global/assets/icons.dart';
import 'package:shap/global/assets/images.dart';
import 'package:shap/global/common_widgets/reponsive_text_widget.dart';
import 'package:shap/global/common_widgets/resize_text_widget.dart';
import 'package:shap/global/theme/themes.dart';
import 'package:animate_do/animate_do.dart';

class IntroPageNew extends StatefulWidget {
  const IntroPageNew({Key? key}) : super(key: key);

  @override
  State<IntroPageNew> createState() => _IntroPageNewState();
}

class _IntroPageNewState extends State<IntroPageNew> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: heightScreen,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widthScreen * 0.8,
                    child: Image.asset(shNewLogoIcon),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: heightScreen * 0.1),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: isLandscape ? Axis.horizontal : Axis.vertical,
                      children: [
                        FadeInLeft(
                          delay: const Duration(milliseconds: 500),
                          duration: const Duration(milliseconds: 300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                child: Image.asset(
                                  raketeIcon,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ResponsiveTextWidget(
                                  text: "SCHNELL",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                        isLandscape
                            ? FadeInDown(
                                duration: const Duration(milliseconds: 300),
                                delay: const Duration(seconds: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Image.asset(schild),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: ResponsiveTextWidget(
                                        text: "SICHER",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : FadeInRight(
                                delay: const Duration(seconds: 2),
                                duration: const Duration(milliseconds: 300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Image.asset(schild),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: ResponsiveTextWidget(
                                        text: "SICHER",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 30,
                          width: 30,
                        ),
                        isLandscape
                            ? FadeInRight(
                                delay: const Duration(seconds: 3),
                                duration: const Duration(milliseconds: 300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Image.asset(hakenIcon),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: ResponsiveTextWidget(
                                        text: "AKTUELL",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : FadeInLeft(
                                delay: const Duration(seconds: 3),
                                duration: const Duration(milliseconds: 300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      child: Image.asset(hakenIcon),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: ResponsiveTextWidget(
                                        text: "AKTUELL",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Flex(
                        mainAxisAlignment: MainAxisAlignment.center,
                        direction:
                            isLandscape ? Axis.horizontal : Axis.vertical,
                        children: [
                          SizedBox(
                            width: isLandscape
                                ? widthScreen * 0.3
                                : widthScreen * 0.6,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                backgroundColor: MaterialStateProperty.all(red),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                child: Text(
                                  "GAST ZUGANG",
                                  style: theme.textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                      fontSize: widthScreen > 600 ? 20 : 15),
                                ),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, searchPage),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                            width: 15,
                          ),
                          SizedBox(
                            width: isLandscape
                                ? widthScreen * 0.3
                                : widthScreen * 0.6,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                child: Text(
                                  "ZUM LOGIN",
                                  style: theme.textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                      fontSize: widthScreen > 600 ? 20 : 15),
                                ),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, loginPage),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.pushNamed(context, registerPage),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ResponsiveTextWidget(
                                text: "Sie haben noch keinen ",
                                fontWeight: FontWeight.bold,
                              ),
                              ResponsiveTextWidget(
                                  text: "Account?",
                                  fontWeight: FontWeight.bold,
                                  color: red),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
