import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  String? imageName;
  LogoButton({
    String? imageName,
  }) {
    this.imageName = imageName;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 44,
        height: 44,
        child: Image.asset(imageName.toString()),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
