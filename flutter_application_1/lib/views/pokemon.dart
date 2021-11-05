import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/back_button.dart';
import 'package:flutter_application_1/widgets/pokemon_card.dart';
import 'package:flutter_application_1/widgets/top_button.dart';
import 'package:dio/dio.dart';

void getHttp() async {
  var dio = Dio();
  // dio.options
  //   ..baseUrl = 'http://httpbin.org/'
  //   ..connectTimeout = 5000 //5s
  //   ..receiveTimeout = 5000
  //   ..validateStatus = (int? status) {
  //     return status != null && status > 0;
  //   }
  //   ..headers = {
  //     HttpHeaders.userAgentHeader: 'dio',
  //     'common-header': 'xx',
  //   };

  // // Or you can create dio instance and config it as follow:
  // //  var dio = Dio(BaseOptions(
  // //    baseUrl: "http://www.dtworkroom.com/doris/1/2.0.0/",
  // //    connectTimeout: 5000,
  // //    receiveTimeout: 5000,
  // //    headers: {
  // //      HttpHeaders.userAgentHeader: 'dio',
  // //      'common-header': 'xx',
  // //    },
  // //  ));
  // dio.interceptors
  //   ..add(InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       // return handler.resolve( Response(data:"xxx"));
  //       // return handler.reject( DioError(message: "eh"));
  //       return handler.next(options);
  //     },
  //   ))
  //   ..add(LogInterceptor(responseBody: false)); //Open log;

  var response = await dio.get('https://pokeapi.co/api/v2/pokemon/1/');

  Map<String, dynamic> TestPokemon = jsonDecode(response.toString());
  print(TestPokemon['forms'][0]['name']);

  // PokemonModel bulbasaur = PokemonModel(TestPokemon['forms'][0]['name']);
  // bulbasaur.about();
  List<PokemonModel> pokemons = [];
  pokemons.add(PokemonModel.fromNetwork(TestPokemon['forms'][0]));
  print(pokemons[0].name);
  // print(response);
}

class PokemonModel {
  String name;
  PokemonModel({
    required this.name,
  });

  /// data: Map<String, dynamic>
  factory PokemonModel.fromNetwork(dynamic data) {
    return PokemonModel(
      name: data['name'],
    );
  }
}

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
        padding: EdgeInsets.fromLTRB(24, 0, 26, 29),
        children: [
          GestureDetector(
            child: PokemonCard(
              pokemonImage: 'assets/image/pokemon_test.png',
              pokemonName: 'Stella',
              pokemonSize: '14-oz bag',
              pokemonPrice: '29.99',
              count: '01',
            ),
            onTap: () {
              getHttp();
            },
          ),
          PokemonCard(
            pokemonImage: 'assets/image/pokemon_test.png',
            pokemonName: 'Stella',
            pokemonSize: '14-oz bag',
            pokemonPrice: '29.99',
            count: '01',
          ),
          PokemonCard(
            pokemonImage: 'assets/image/pokemon_test.png',
            pokemonName: 'Stella',
            pokemonSize: '14-oz bag',
            pokemonPrice: '29.99',
            count: '00',
          ),
          PokemonCard(
            pokemonImage: 'assets/image/pokemon_test.png',
            pokemonName: 'Stella',
            pokemonSize: '14-oz bag',
            pokemonPrice: '29.99',
            count: '00',
          ),
          PokemonCard(
            pokemonImage: 'assets/image/pokemon_test.png',
            pokemonName: 'Stella',
            pokemonSize: '14-oz bag',
            pokemonPrice: '29.99',
            count: '00',
          ),
        ],
      ),
    );
  }
}
