import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/network.dart';
import 'package:flutter_application_1/widgets/ability_slider.dart';
import 'package:flutter_application_1/widgets/back_button.dart';
import 'package:flutter_application_1/widgets/category_title.dart';
import 'package:flutter_application_1/widgets/product_widget.dart';
import 'package:flutter_application_1/widgets/top_button.dart';

class Adoption extends StatefulWidget {
  @override
  State<Adoption> createState() => _AdoptionState();
}

class _AdoptionState extends State<Adoption> {
  bool loading = true;
  List<PokemonModel> pokemonData = [];

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    fetch();
    // TODO: implement initState
    super.initState();
  }

  @override
  void fetch() async {
    pokemonData = await getHttp(
      from: '10',
      count: '2',
    );
    loading = false;
    setState(() {});
  }

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
            // AbilitySlider(
            //   sliderItems: abilityItem,
            // ),
            AbilitySlider(
              sliderItems: abilityItem,
            ),
            Container(
              child: CategoryTitle(
                categoryName: 'Dog',
                titleColor: Colors.red[200],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: loading ? loadPage() : card(),
            ),
            Container(
              margin: EdgeInsets.only(top: 44),
              child: CategoryTitle(
                categoryName: 'Cat',
                titleColor: Colors.blue[700],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: loading ? loadPage() : card(),
            ),
          ],
        ),
      ),
    );
  }

  Widget card() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: pokemonData
          .map(
            (PokemonModel element) => ProductWidget(
              image: element.iconFront,
              name: element.name,
              gender: 'Female',
              subName: 'German Shorth',
              backgroundColor: Colors.red[200],
            ),
          )
          .toList()
          .sublist(0, 2),
    );
  }

  Widget loadPage() {
    return Container(
      margin: EdgeInsets.only(
        top: 24,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              width: 300.0,
              height: 200.0,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: Center(
                      child: Text(
                        "loading.. wait...",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
