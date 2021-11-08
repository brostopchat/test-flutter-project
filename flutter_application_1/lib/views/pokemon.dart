import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/network.dart';
import 'package:flutter_application_1/widgets/back_button.dart';
import 'package:flutter_application_1/widgets/pokemon_card.dart';
import 'package:flutter_application_1/widgets/top_button.dart';

class Pokemon extends StatefulWidget {
  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
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
      from: '20',
      count: '5',
    );
    loading = false;
    setState(() {});
  }

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
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 26, 29),
        child: loading ? loadPage() : body(),
      ),
    );
  }

  Widget body() {
    return ListView(
      children: pokemonData
          .map(
            (PokemonModel element) => PokemonCard(
              pokemonImage: element.iconFront,
              pokemonName: element.name,
              pokemonSize: '25252',
              pokemonPrice: '523535',
              count: '01',
            ),
          )
          .toList(),
    );
  }

  Widget loadPage() {
    return Container(
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
