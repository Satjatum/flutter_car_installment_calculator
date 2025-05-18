import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUi extends StatefulWidget {
  double? carPrice;
  double? payPerMonth;
  int? month;

  //เอาตัวแปรมารอรับค่าที่ส่งมา
  ResultScreenUi({super.key, this.carPrice, this.payPerMonth, this.month});

  @override
  State<ResultScreenUi> createState() => _ResultScreenUiState();
}

class _ResultScreenUiState extends State<ResultScreenUi> {
  @override
  Widget build(BuildContext context) {
    //กำหนดรูปแบบของตัวเลข คอมมาคัน ทศนิยม 2 ตำแหน่ง
    NumberFormat fm = NumberFormat('#,###,##0.00');

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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "ผ่อนทั้งหมด ",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // สีของข้อความปกติ
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "${widget.month}",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // กำหนดให้ widget.month เป็นสีแดง
                    ),
                  ),
                  TextSpan(
                    text: " เดือน",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // สีของข้อความปกติ
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "ค่างวดรถต่อเดือน",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${fm.format(widget.payPerMonth)}',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              "บาท",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
