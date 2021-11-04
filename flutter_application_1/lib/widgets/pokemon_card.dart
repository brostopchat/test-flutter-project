import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonCard extends StatelessWidget {
  String? pokemonName;
  String? pokemonSize;
  String? pokemonPrice;
  String? pokemonImage;
  String? count;

  PokemonCard({
    String? pokemonImage,
    String? pokemonName,
    String? pokemonSize,
    String? pokemonPrice,
    String? count,
  }) {
    this.pokemonImage = pokemonImage;
    this.pokemonName = pokemonName;
    this.pokemonSize = pokemonSize;
    this.pokemonPrice = pokemonPrice;
    this.count = count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  width: 93,
                  height: 77,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(pokemonImage.toString()),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        pokemonName.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Size: $pokemonSize',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        pokemonPrice.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/svg_icon/arrow_up.svg'),
                      Text(count.toString()),
                      SvgPicture.asset('assets/svg_icon/arrow_down.svg')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
