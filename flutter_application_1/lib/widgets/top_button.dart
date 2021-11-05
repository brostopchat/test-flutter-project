import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/adoption.dart';
import 'package:flutter_application_1/views/pokemon.dart';

class TopButton extends StatelessWidget {
  String? imageName;
  TopButton({
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
        child: Container(
          child: Image.asset(
            imageName.toString(),
          ),
        ),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Pokemon(),
          ),
        );
      },
    );
  }
}
