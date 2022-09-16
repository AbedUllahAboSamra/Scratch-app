import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/HomeScreen.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/PtofileScreen.dart';
import 'package:scratchfood/Screens/MainScreen/SearchScreen/SearchScreen.dart';

class MainScreenController extends StatefulWidget {
  static String mainScreenNamed = '/mainScreen';
  const MainScreenController({super.key});

  @override
  State<MainScreenController> createState() => _MainScreenControllerState();
}

class _MainScreenControllerState extends State<MainScreenController> {
  int index = 1;
  List<Widget> bodyWidget = [Search(), Home(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: bodyWidget[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icon/search.png",
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Color(0xFF363837)
                      : Colors.grey[200],
            ),
            label: "",
            activeIcon: Image.asset(
              "assets/Icon/search.png",
              color: Color(0xFF30BE76),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icon/home.png",
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Color(0xFF363837)
                      : Colors.grey[200],
            ),
            label: "",
            activeIcon: Image.asset(
              "assets/Icon/home.png",
              color: Color(0xFF30BE76),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icon/profile.png",
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Color(0xFF363837)
                      : Colors.grey[200],
            ),
            label: "",
            activeIcon: Image.asset(
              "assets/Icon/profile.png",
              color: Color(0xFF30BE76),
            ),
          ),
        ],
      ),
    );
  }
}
