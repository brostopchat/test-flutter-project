import 'package:flutter/material.dart';

class UiKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text('UI Kit')),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 80.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (int index) {
                  return Container(
                    color: Colors.blue[index * 100],
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: Text("$index"),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
