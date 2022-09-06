import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratchfood/Screens/MainScreen/HomeScreen/HomeScreen.dart';
import 'package:scratchfood/Screens/MainScreen/ProfileScreen/PtofileScreen.dart';
import 'package:scratchfood/Screens/MainScreen/SearchScreen/SearchScreen.dart';

class MainScreenController extends StatefulWidget {
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
      body: bodyWidget[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.app), label: ""),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: ""),
        ],
      ),
    );
  }
}
