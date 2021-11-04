import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/back_button.dart';
import 'package:flutter_application_1/widgets/top_button.dart';

class Pokemon extends StatelessWidget {
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
                    'Pokemons',
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
      body: ListView(
        children: [],
      ),
    );
  }
}
