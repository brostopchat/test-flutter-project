import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  String? image;
  String? name;
  String? gender;
  String? subName;
  Color? backgroundColor;
  ProductWidget({
    String? image,
    String? name,
    String? gender,
    String? subName,
    Color? backgroundColor,
  }) {
    this.image = image;
    this.name = name;
    this.gender = gender;
    this.subName = subName;
    this.backgroundColor = backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                child: Positioned(
                  child: Container(
                    width: 156,
                    height: 184,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  bottom: -20,
                ),
              ),
              Center(
                child: Container(
                  child: Image.network(
                    image!,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          gender.toString(),
                          style: TextStyle(
                            color: Colors.red[500],
                            fontSize: 10,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 4, 0, 16),
                  child: Row(
                    children: [
                      Container(
                        child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            subName.toString(),
                            style: TextStyle(
                              fontFamily: '',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
