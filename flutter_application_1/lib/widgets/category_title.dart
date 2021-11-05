import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/adoption.dart';
import 'package:flutter_application_1/views/pokemon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryTitle extends StatelessWidget {
  String? categoryName;
  Color? titleColor;

  CategoryTitle({
    String? categoryName,
    Color? titleColor,
  }) {
    this.categoryName = categoryName;
    this.titleColor = titleColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              categoryName.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: titleColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
            ),
            padding: EdgeInsets.fromLTRB(24, 2, 24, 2),
          ),
          Container(
            child: GestureDetector(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'See more',
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset(
                      'assets/svg_icon/arrow_right.svg',
                      color: titleColor,
                    ),
                    height: 16,
                    width: 16,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Adoption(),
                  ),
                );
              },
            ),
            margin: EdgeInsets.fromLTRB(9, 0, 29, 0),
          ),
        ],
      ),
    );
  }
}
