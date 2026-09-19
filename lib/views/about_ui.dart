import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //1
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Health Calculator',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/calculate.png',
                  width: MediaQuery.of(context).size.height * 0.15,
                  height: MediaQuery.of(context).size.height * 0.15,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                  ),
                ),
                Text(
                  'คำนวณหาแคลลอรี่ที่ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                  ),
                ),
              ],
            ),
          ),
          //2
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/saulogo.png',
                  width: MediaQuery.of(context).size.height * 0.08,
                  height: MediaQuery.of(context).size.height * 0.08,
                  fit: BoxFit.cover,
                ),
                 SizedBox(
                  height: 10,
                ),
                Text(
                  '© 2026 SAU. All rights reserved. 🎄🎄🎄',
                ),
                Text(
                  'Created by Software Development Team',
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
