import 'package:flutter/material.dart';

class GalerySliderControl extends StatelessWidget {
  List<String> galeryItems = [];
  int activeIndex = 1;
  GalerySliderControl({
    required List<String> galeryItems,
    required int activeIndex,
  }) {
    this.galeryItems = galeryItems;
    this.activeIndex = activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sliderButton = [];
    for (var i = 0; i <= galeryItems.length - 1; i++) {
      sliderButton.add(
        AnimatedContainer(
          width: activeIndex == i ? 15 : 5,
          height: 5,
          margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: activeIndex == i ? Colors.brown.shade200 : Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.brown.shade200,
            ),
          ),
          duration: Duration(milliseconds: 200),
        ),
      );
    }

    return Container(
      child: Row(
        children: sliderButton,
      ),
    );
  }
}
