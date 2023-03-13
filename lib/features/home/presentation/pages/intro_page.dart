import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../app_routes.dart';
import '../../../../global/theme/themes.dart';
import '../../../../global/translation/generated/locale_keys.g.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/icons/homePage/background_image.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const Positioned(
            left: 20,
            top: 20,
            height: 60,
            child: Image(
              image: AssetImage('assets/icons/homePage/white_logo_sh.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 120,
                width: 120,
                child: const Icon(
                  Icons.house_siding_sharp,
                  color: Colors.white,
                  size: 60,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 80,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: theme.textTheme.headline4
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Text(
                  LocaleKeys.intro_page_sofort_name.tr(),
                  style: theme.textTheme.headline1?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                Text(
                  LocaleKeys.intro_page_register_commercial.tr(),
                  style: theme.textTheme.headline1?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    LocaleKeys.intro_page_app_description.tr(),
                    style: theme.textTheme.headline5
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 10),
                  child: ElevatedButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          LocaleKeys.intro_page_search_for_comapnies.tr(),
                          style: theme.textTheme.headline4
                              ?.copyWith(color: greyLight),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.search,
                            size: 30.0,
                            color: greyLight,
                          ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black38),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text(
                      LocaleKeys.intro_page_getting_started.tr(),
                      style: theme.textTheme.headline4?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, loginPage),
                    child: Text(
                      LocaleKeys.intro_page_login.tr(),
                      style: theme.textTheme.headline4?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
