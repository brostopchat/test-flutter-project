import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/ability_slider.dart';
import 'package:flutter_application_1/widgets/back_button.dart';
import 'package:flutter_application_1/widgets/category_title.dart';
import 'package:flutter_application_1/widgets/product_widget.dart';
import 'package:flutter_application_1/widgets/top_button.dart';

class Adoption extends StatelessWidget {
  List<String> abilityItem = [
    'assets/image/dogs1.png',
    'assets/image/dogs1.png',
    'assets/image/dogs1.png',
    'assets/image/dogs1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    imageName: 'assets/button/left_arrow2.png',
                  ),
                  Text(
                    'Adoption',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TopButton(
                    imageName: 'assets/button/profile_image.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AbilitySlider(
              sliderItems: abilityItem,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 24,
              ),
              child: CategoryTitle(
                categoryName: 'Dog',
                titleColor: Colors.red[200],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProductWidget(
                    image: 'assets/image/dog1.png',
                    name: 'Progy',
                    sex: 'Male',
                    subName: 'German Shorth',
                    backgroundColor: Colors.red[200],
                  ),
                  ProductWidget(
                    image: 'assets/image/dog1.png',
                    name: 'Peny',
                    sex: 'Female',
                    subName: 'German Shorth',
                    backgroundColor: Colors.blue[200],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 44),
              child: CategoryTitle(
                categoryName: 'Cat',
                titleColor: Colors.blue[700],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProductWidget(
                    image: 'assets/image/cat1.png',
                    name: 'Progy',
                    sex: 'Male',
                    subName: 'German Shorth',
                    backgroundColor: Colors.red[200],
                  ),
                  ProductWidget(
                    image: 'assets/image/cat1.png',
                    name: 'Peny',
                    sex: 'Female',
                    subName: 'German Shorth',
                    backgroundColor: Colors.blue[200],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
