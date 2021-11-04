import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AbilitySlider extends StatefulWidget {
  List<String> sliderItems = [];

  AbilitySlider({
    required List<String> sliderItems,
  }) {
    this.sliderItems = sliderItems;
  }

  @override
  State<AbilitySlider> createState() => _AbilitySliderState();
}

class _AbilitySliderState extends State<AbilitySlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 2.0,
          initialPage: 0,
          enableInfiniteScroll: false,
        ),
        items: widget.sliderItems.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 240,
                height: 192,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 240,
                          height: 152,
                          color: Colors.red[200],
                        ),
                        Center(
                          child: Image.asset(
                            i,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Container(
                        height: 80,
                        width: 240,
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pet-holic Club',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SvgPicture.asset(
                                    'assets/svg_icon/addButton.svg'),
                              ],
                            ),
                            Text(
                              '150k Members',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
