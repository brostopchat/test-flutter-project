import 'dart:convert';

import 'package:dio/dio.dart';

var dio = Dio();

Future<List<PokemonModel>> getHttp({
  required String from,
  required String count,
}) async {
  List<PokemonModel> pokemons = [];
  String nameWay =
      'https://pokeapi.co/api/v2/pokemon/?limit=' + count + '&offset=' + from;

  var response = await dio.get(nameWay);

  Map<String, dynamic> testPokemon = jsonDecode(response.toString());

  for (var i = 0; i < testPokemon['results'].length; i++) {
    response = await dio.get(testPokemon['results'][i]['url']);
    Map<String, dynamic> pokemonImage = jsonDecode(response.toString());

    // String genderWay = '';
    // response = await dio.get(genderWay);

    pokemons.add(
      PokemonModel.fromNetwork(
        data: testPokemon['results'][i],
        iconFrontWay: pokemonImage['sprites'],
      ),
    );

    print(testPokemon['results'][i]);
    // print(pokemons[i].name);
  }

  return pokemons;
  // print(response);
}

class PokemonModel {
  String name;
  String iconFront;
  PokemonModel({
    required this.name,
    required this.iconFront,
  });

  /// data: Map<String, dynamic>
  factory PokemonModel.fromNetwork({
    dynamic data,
    dynamic iconFrontWay,
    // dynamic gender,
  }) {
    return PokemonModel(
      name: data['name'],
      iconFront: iconFrontWay['front_default'],
    );
  }
}
