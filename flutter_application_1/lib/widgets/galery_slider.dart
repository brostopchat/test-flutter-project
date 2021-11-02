import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GalerySlider extends StatelessWidget {
  List<String> galeryItem = [];
  GalerySlider({
    required List<String> galeryItem,
  }) {
    this.galeryItem = galeryItem;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(height: 177),
        items: galeryItem.map((i) {
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
                // child: Text(
                //   'text $i',
                //   style: TextStyle(fontSize: 16.0),
                // ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
