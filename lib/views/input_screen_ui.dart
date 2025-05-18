// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

class InputScreenUi extends StatefulWidget {
  const InputScreenUi({super.key});

  @override
  State<InputScreenUi> createState() => _InputScreenUiState();
}

class _InputScreenUiState extends State<InputScreenUi> {
  //ตัวแปรควบคุม TextField
  TextEditingController _CarPriceCtrl = TextEditingController();
  TextEditingController _InterestCtrl = TextEditingController();

  //ตัวแปรควบคุม Radio
  int _downCtrl = 10;

  //ตัวแปรควบคุม DropDown

  int _monthCtrl = 24;

  //สร้างตัวแปรเก็บรูปที่เลือกจากกล้องหรือแกลอรี่
  File? _imageFile;

  //สร้างเมธอดแสดง Dialog แจ้งเตือน
  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("คำเตือน"),
        content: Text(
          msg,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "ตกลง",
            ),
          ),
        ],
      ),
    );
  }

  // สร้างเมธอลเปิดกล้อง
  _openCamera() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  // สร้างเมธอลเปิดแกลอรี่
  _openGallery() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "คำนวนค่างวดรถ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      //เปิด Snacker ให้ผู้เลือกเปิดกล้องหรือแกลอรี่
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                title: Text(
                                  "เปิดกล้อง (Open Camera)",
                                ),
                                leading: Icon(
                                  Icons.camera,
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                title: Text(
                                  "เปิดแกลอรี่ (Open Gallery)",
                                ),
                                leading: Icon(
                                  Icons.image,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: _imageFile == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/img02.png',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ราคารถ (บาท)",
                  ),
                ),
                TextField(
                  controller: _CarPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "จำนวนเงินดาวน์ (%)",
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 10,
                      groupValue: _downCtrl,
                    ),
                    Text(
                      "10",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 20,
                      groupValue: _downCtrl,
                    ),
                    Text(
                      "20",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 30,
                      groupValue: _downCtrl,
                    ),
                    Text(
                      "30",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 40,
                      groupValue: _downCtrl,
                    ),
                    Text(
                      "40",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 50,
                      groupValue: _downCtrl,
                    ),
                    Text(
                      "50",
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downCtrl = value!;
                        });
                      },
                      value: 60,
                      groupValue: _downCtrl,
                    ),
                    Text(
                      "60",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ระยะเวลาผ่อน (เดือน)",
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: DropdownButton<int>(
                      value: _monthCtrl,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (int? value) {
                        setState(() {
                          _monthCtrl = value!;
                        });
                      },
                      items: <int>[
                        24,
                        36,
                        48,
                        60,
                        72,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value เดือน',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "อัตราดอกเบี้ย (0%/0)",
                  ),
                ),
                TextField(
                  controller: _InterestCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Validate UI หากมีปัญหาให้แสดง Dialog แจ้งเตือน
                    if (_CarPriceCtrl.text.isEmpty) {
                      _warningDialog("กรุณาป้อนราคารถ");
                    } else if (_InterestCtrl.text.isEmpty) {
                      _warningDialog("กรุณาป้อนอัตราดอกเบี้ย");
                    }

                    //คำนวน
                    double carPrice = double.parse(_CarPriceCtrl.text);
                    double interest = double.parse(_InterestCtrl.text);
                    //ยอดจัด = ราคารถ - เงินดาวน์
                    double balance = carPrice - (carPrice * _downCtrl / 100);
                    // ดอกเบี้ยที่ต้องจ่ายทั้งหมด = (ยอดจัด * อัตราดอกเบี้ย / 100 / 12 ) * จำนวยเดือนผ่อน
                    double totalInterest =
                        (balance * interest / 100 / 12) * _monthCtrl;

                    // ยอดที่ต้องผ่อนต่อเดือน = (ยอดจัด + ดอกเบี้ยทื่่ต้องจ่ายทั้งหมด) / จำนวนเดือนผ่อน
                    double payPerMonth = (balance + totalInterest) / _monthCtrl;

                    //ส่งผลไปแสดงที่หน้า Result โดยเปิดแบบย้อนกลับได้
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreenUi(
                          carPrice: carPrice,
                          payPerMonth: payPerMonth,
                          month: _monthCtrl,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //เคลียทุกอย่างให้เป็นเหมือนเดิม
                      _CarPriceCtrl.text = '';
                      _InterestCtrl.text = '';
                      _downCtrl = 10;
                      _monthCtrl = 24;
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
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
