import 'package:flutter/material.dart';

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  //ควบคุมtextfield
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  String bmiValue = '0.00';
  String bmiResult = 'การแปรผล';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 233, 233),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              bottom: 50.0,
              left: 45.0,
              right: 45.0,
            ),
            child: Column(
              children: [
                Text(
                  'คำนวนหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Image.asset(
                  'assets/images/bmi.png',
                  width: MediaQuery.of(context).size.height * 0.15,
                  // height: MediaQuery.of(context).size.height * 0.15,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "น้ำหนัก (kg.)",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ส่วนสูง (cm.)",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (weightCtrl.text.isEmpty || heightCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    double weight = double.parse(weightCtrl.text);
                    double height = double.parse(heightCtrl.text) / 100;
                    double bmi = weight / ((height) * (height));

                    setState(() {
                      bmiValue = bmi.toStringAsFixed(2);
                      if (bmi < 18.5) {
                        bmiResult = 'น้ำหนักต่ำกว่าเกณฑ์';
                      } else if (bmi <= 22.9) {
                        bmiResult = 'น้ำหนักปกติสมส่วน';
                      } else if (bmi <= 24.9) {
                        bmiResult = 'น้ำหนักเกิน';
                      } else if (bmi <= 29.9) {
                        bmiResult = 'โรคอ้วนระดับ 1';
                      } else {
                        bmiResult = 'โรคอ้วนระดับ 2';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.055,
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 85, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text('คำนวณ BMI',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weightCtrl.text = '';
                      heightCtrl.text = '';
                      bmiValue = '0.00';
                      bmiResult = 'การแปรผล';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text('ล้างข้อมูล',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 35),
                  color: Color.fromARGB(255, 142, 232, 145),
                  child: Column(
                    children: [
                      Text('BMI',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(bmiValue,
                          style: TextStyle(
                              fontSize: 32,
                              color: const Color.fromARGB(255, 255, 38, 0))),
                      Text(bmiResult,
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
