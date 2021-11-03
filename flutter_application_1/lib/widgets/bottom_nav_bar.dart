import 'package:flutter/material.dart';

class BottomNavBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // home
          GestureDetector(
            child: Container(
              color: Colors.red,
              height: 16,
              width: 16,
            ),
          ),
          // navigate
          GestureDetector(
            child: Container(
              color: Colors.red,
              height: 16,
              width: 16,
            ),
          ),
          // search
          GestureDetector(
            child: Container(
              color: Colors.red,
              height: 16,
              width: 16,
            ),
          ),
          // message
          GestureDetector(
            child: Container(
              color: Colors.red,
              height: 16,
              width: 16,
            ),
          ),
          // notifi
          GestureDetector(
            child: Container(
              color: Colors.red,
              height: 16,
              width: 16,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, -1),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 22, 0, 50),
    );
  }
}
