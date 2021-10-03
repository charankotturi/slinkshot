import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slingshot/skin_model.dart';

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

final skinsList = [
  SkinModel(skinName: "Yveltal", skinID: 1, skinValue: 250),
  SkinModel(skinName: "Kyurem", skinID: 2, skinValue: 300),
  SkinModel(skinName: "Articuno", skinID: 3, skinValue: 900),
  SkinModel(skinName: "Moltrus", skinID: 4, skinValue: 1000),
  SkinModel(skinName: "Charizard", skinID: 5, skinValue: 250),
  SkinModel(skinName: "Zapdos", skinID: 6, skinValue: 120),
  SkinModel(skinName: "Solgaleo", skinID: 7, skinValue: 750),
  SkinModel(skinName: "Giratina Y", skinID: 8, skinValue: 500),
  SkinModel(skinName: "Dialga", skinID: 9, skinValue: 300),
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

final imageAndVideoString = [
  'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
  'https://www.pngmart.com/files/19/Darkrai-Transparent-Background.png'
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

final String sampleDescription =
    'The original Pokémon is a role-playing game based around building a small team of monsters to battle other monsters in a quest to become the best. Pokémon are divided into types, such as water and fire, each with different strengths. Battles between them can be likened to the simple hand game rock-paper-scissors. For example, to gain an advantage over a Pokémon that cannot beat an opponent’s Charizard character because of a weakness to fire, a player might substitute a water-based Pokémon. With experience, Pokémon grow stronger, gaining new abilities. By defeating Gym Leaders and obtaining Gym Badges, trainers garner acclaim.';
