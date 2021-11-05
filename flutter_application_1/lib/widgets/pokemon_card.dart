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
      width: 327,
      color: Colors.red[100],
      margin: EdgeInsets.only(
        top: 29,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 93,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 93,
                    height: 77,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 7,
                    ),
                    child: Image.asset(pokemonImage.toString()),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue[100],
            width: 234,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 77,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      height: 77,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/svg_icon/arrow_up.svg',
                            ),
                          ),
                          Text(
                            count.toString(),
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/svg_icon/arrow_down.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
