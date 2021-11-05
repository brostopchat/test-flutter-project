import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbilitySlider extends StatelessWidget {
  List<String> sliderItems = [];

  AbilitySlider({
    required List<String> sliderItems,
  }) {
    this.sliderItems = sliderItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(
        left: 8,
      ),
      child: ListView(
        // padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        scrollDirection: Axis.horizontal,
        children: List.generate(sliderItems.length, (int index) {
          return Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
              width: 240,
              height: 192,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: Positioned(
                          child: Container(
                            height: 192,
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Image.asset(
                            'assets/image/dogs1.png',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 80,
                          width: 240,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Pet-holic Club',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: SvgPicture.asset(
                                        'assets/svg_icon/addButton.svg',
                                      ),
                                      // padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 4, 0, 16),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 4,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Text(
                                          '150k Members',
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
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
            ),
          );
        }),
      ),
    );
  }
}
