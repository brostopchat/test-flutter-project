import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/galery_slider.dart';

import 'widgets/product_widget.dart';
import 'widgets/top_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopButton(
                    imageName: 'assets/button/pawprint.png',
                  ),
                  TopButton(
                    imageName: 'assets/button/profileImage.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                GalerySlider(
                  galeryItem: [
                    'assets/image/galery1.jpg',
                    'assets/image/galery2.jpg',
                    'assets/image/galery3.jpg',
                    'assets/image/galery4.jpg',
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProductWidget(
                  image: 'assets/image/dog1.png',
                  name: 'Progy',
                  sex: 'Male',
                  subName: 'German Shorth',
                  backgroundColor: Colors.blue[100],
                ),
                ProductWidget(
                  image: 'assets/image/cat1.png',
                  name: 'Mui',
                  sex: 'Female',
                  subName: 'German Shorth',
                  backgroundColor: Colors.red[200],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
