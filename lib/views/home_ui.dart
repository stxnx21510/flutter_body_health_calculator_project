import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/about_ui.dart';
import 'package:flutter_application_1/views/bmi_ui.dart';
import 'package:flutter_application_1/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int selectedIndex = 1;

  List subViewShow = [
    BmiUI(),
    AboutUI(),
    BmrUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heartCircleCheck,
            ),
            label: 'BMR',
          ),
        ],
      ),
      body: subViewShow[selectedIndex],
    );
  }
}
