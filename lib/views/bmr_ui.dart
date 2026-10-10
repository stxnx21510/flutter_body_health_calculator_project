// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
// ตัวแปรที่ทำงานกับเพศชายหรือหญิง และ เกี่ยวกับการคำนวณ BMR
  bool isMale = true;

  //ตัวควบคุม textfield  TextEditingController weightController = TextEditingController();
  TextEditingController heightctrl = TextEditingController();
  TextEditingController weightctrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();

  //สร้างตัวแปรเพื่อเก็บค่าที่คำนวณได้
  String bmrvalue = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 233, 233),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 50,
            left: 45,
            right: 45,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาอัตราการเผาผลาญที่',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Image.asset(
                  'assets/images/bmr.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                // เพศ
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Text(
                        'ชาย',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        //ternary operator คือ คำสั่งเช็คเงื่อนไข และ ให้ค่าที่ต้องการ
                        backgroundColor: isMale
                            ? const Color.fromARGB(255, 198, 221, 255)
                            : const Color.fromARGB(255, 255, 255, 255),
                        //
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.36,
                          50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Text('หญิง',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                          )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isMale
                            ? const Color.fromARGB(255, 246, 198, 255)
                            : const Color.fromARGB(255, 255, 255, 255),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.36,
                          50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: weightctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: heightctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: agectrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกอายุของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    //แก้ code
                    if (weightctrl.text.isEmpty ||
                        heightctrl.text.isEmpty ||
                        agectrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    double weight = double.parse(weightctrl.text);
                    double height = double.parse(heightctrl.text);
                    int age = int.parse(agectrl.text);
                    double bmr = 0;
                    if (isMale == true) {
                      bmr = 88.362 +
                          (13.397 * weight) +
                          (4.799 * height) -
                          (5.677 * age);
                    } else {
                      bmr = 447.593 +
                          (9.247 * weight) +
                          (3.098 * height) -
                          (4.330 * age);
                    }
                    setState(() {
                      bmrvalue = bmr.toStringAsFixed(2);
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 65, 0),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ElevatedButton(
                  onPressed: () {
                    weightctrl.clear();
                    heightctrl.clear();
                    agectrl.clear();
                    bmrvalue = '0.00';
                    isMale = true;
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 142, 232, 145),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Text('BMR',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(bmrvalue,
                          style: TextStyle(
                              fontSize: 32,
                              color: Color.fromARGB(255, 255, 38, 0))),
                      Text('kcal/day',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
