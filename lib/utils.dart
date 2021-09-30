import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final imageList = [
  'https://www.pngmart.com/files/19/Darkrai-Transparent-Background.png',
  'https://www.pngkit.com/png/full/62-623168_legendary-pokemon-png-hd-legendary-pokemon-transparent.png',
  'https://assets.stickpng.com/images/585960bd4f6ae202fedf2856.png',
  'https://assets.stickpng.com/images/5859650e4f6ae202fedf2860.png',
  'https://assets.stickpng.com/images/5859662e4f6ae202fedf2878.png',
  'https://assets.stickpng.com/images/580b57fcd9996e24bc43c32d.png',
  'https://assets.stickpng.com/images/58595e144f6ae202fedf284f.png',
  'https://www.pngkit.com/png/full/155-1553602_mega-giratina-pokdex-legendary-mega-evolution-pokemon.png',
  'https://images.pngnice.com/download/2007/Legendary-Pokemon-Transparent-PNG.png',
];

final mainTags = [
  'All',
  'Followed',
  'game1',
  'game2',
  'game3',
  'game4',
  'game5',
  'game6',
  'game7',
  'game8'
];

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.black12),
  borderRadius: BorderRadius.circular(20),
);

kGradientBoxDecoration(
        {required List<Color> colors, bool isVerticalGrad = false}) =>
    BoxDecoration(
      gradient: isVerticalGrad
          ? LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          : LinearGradient(colors: colors),
      borderRadius: BorderRadius.circular(25),
    );
