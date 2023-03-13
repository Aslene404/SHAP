import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:shap/features/app_navigation/tabs/article_tab/article_page.dart';
import 'package:shap/features/app_navigation/tabs/document_tab/document_page.dart';
import 'package:shap/features/app_navigation/tabs/profile_tab/profile_page.dart';
import 'package:shap/features/app_navigation/tabs/radar_tab/radar.dart';
import 'package:shap/features/app_navigation/tabs/search_tab/search_page.dart';
import 'package:shap/global/theme/themes.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppNavigationPage extends StatefulWidget {
  AppNavigationPage({Key? key}) : super(key: key);

  @override
  State<AppNavigationPage> createState() => _AppNavigationPageState();
}

class _AppNavigationPageState extends State<AppNavigationPage> {
  // double bottomNavBarHeight = 60;

  // List<TabItem> tabItems = List.of([
  //   TabItem(
  //     Icons.remove_red_eye,
  //     "RADAR",
  //     Colors.blue,
  //     labelStyle:
  //         const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
  //   ),
  //   TabItem(
  //     Icons.description_rounded,
  //     "DOCS",
  //     Colors.blue,
  //     labelStyle:
  //         const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
  //   ),
  //   TabItem(
  //     Icons.search,
  //     "SUCHE",
  //     Colors.grey,
  //     labelStyle:
  //         const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //   ),
  //   TabItem(
  //     Icons.shopping_cart,
  //     "ARTIKEL",
  //     Colors.red,
  //     labelStyle:
  //         const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //   ),
  //   TabItem(
  //     Icons.co_present_outlined,
  //     "ACCOUNT",
  //     Colors.cyan,
  //     labelStyle:
  //         const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //   ),
  // ]);
  int selectedPos = 2;

  // late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    // _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: greyz,
      body: _getPage(selectedPos),
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.blue[100]!,
                gap: 8,
                activeColor: meduimGrey,
                textStyle: theme.textTheme.headline4
                    ?.copyWith(fontSize: widthScreen > 600 ? 16 : 12),
                iconSize: widthScreen > 600 ? 27 : 22,
                textSize: widthScreen > 600 ? 18 : 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[200]!,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.notifications,
                    text: 'NOTIFICATION',
                  ),
                  GButton(
                    icon: Icons.description_rounded,
                    text: 'DOCS',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'SUCH',
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'ARTIKEL',
                  ),
                  GButton(
                    icon: Icons.remove_red_eye,
                    text: "RADAR",
                  ),
                ],
                selectedIndex: selectedPos,
                onTabChange: (index) {
                  setState(() {
                    selectedPos = index;
                  });
                },
              ),
            ),
          ),
          // Positioned(
          //     top: 3,
          //     right: widthScreen * 0.4,
          //     child: Container(
          //       height: 15,
          //       width: 15,
          //       decoration: const BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: green,
          //       ),
          //       child: Center(
          //         child: Text(
          //           "0",
          //           style: theme.textTheme.headline4
          //               ?.copyWith(fontSize: 10, color: Colors.white),
          //         ),
          //       ),
          //     )),
        ],
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return ProfilePage();
      case 1:
        return DocumentPage();
      case 2:
        return SearchPage();
      case 3:
        return ArticlePage();
      case 4:
        return RadarPage();

      default:
        return Container();
    }
  }

  // Widget bottomNav() {
  //   return CircularBottomNavigation(
  //     tabItems,
  //     normalIconColor: Colors.white,
  //     controller: _navigationController,
  //     selectedPos: selectedPos,
  //     barHeight: bottomNavBarHeight,
  //     barBackgroundColor: black,
  //     backgroundBoxShadow: const <BoxShadow>[
  //       BoxShadow(color: Colors.black45, blurRadius: 10.0),
  //     ],
  //     animationDuration: const Duration(milliseconds: 300),
  //     selectedCallback: (int? selectedPos) {
  //       setState(() {
  //         this.selectedPos = selectedPos ?? 0;
  //         print(_navigationController.value);
  //       });
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    // _navigationController.dispose();
  }
}
