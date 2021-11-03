import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/widgets/galery_social.dart';

import 'galery_slider_control.dart';

class GalerySlider extends StatefulWidget {
  List<String> galeryItem = [];

  GalerySlider({
    required List<String> galeryItem,
  }) {
    this.galeryItem = galeryItem;
  }

  @override
  State<GalerySlider> createState() => _GalerySliderState();
}

class _GalerySliderState extends State<GalerySlider> {
  int activeIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 177,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 2,
                        onPageChanged: (int index, _) {
                          setState(() {
                            activeIndex = index;
                          });
                        }),
                    items: widget.galeryItem.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: 327,
                            height: 177,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              i,
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  GalerySocial(
                    likeCount: '1.8k',
                    commentCount: '864',
                    repostCount: '158',
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          child: GalerySliderControl(
            galeryItems: widget.galeryItem,
            activeIndex: activeIndex,
          ),
          margin: EdgeInsets.only(
            top: 12,
          ),
        ),
      ],
    );
  }
}
