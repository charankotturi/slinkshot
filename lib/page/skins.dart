import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:slingshot/models/skin_model.dart';
import 'package:slingshot/utils.dart';
import 'package:slingshot/widgets/single_skin_post.dart';

class SkinsPage extends StatefulWidget {
  const SkinsPage({Key? key}) : super(key: key);

  @override
  _SkinsPageState createState() => _SkinsPageState();
}

class _SkinsPageState extends State<SkinsPage> {
  late TextEditingController _controller;
  List<SkinModel> skins = [];
  bool isOwnedSelected = false;

  _setFilterOption(bool isOwned) {
    setState(() {
      isOwnedSelected = isOwned;
    });
  }

  void onTextChange(String value) {
    skins = [];

    for (var i = 0; i < skinsList.length; i++) {
      if (skinsList[i].skinName.toLowerCase().contains(value.toLowerCase())) {
        skins.add(skinsList[i]);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    skins = skinsList;
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _controller,
            onChanged: onTextChange,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: 'Skins',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: const Border(
                    top: BorderSide(width: 1, color: Colors.black26),
                    bottom: BorderSide(width: 1, color: Colors.black26),
                    right: BorderSide(width: 1, color: Colors.black26),
                    left: BorderSide(width: 1, color: Colors.black26),
                  ),
                ),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      _setFilterOption(false);
                    },
                    child: Container(
                        margin:
                            const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: !isOwnedSelected
                              ? Colors.black26
                              : Colors.black26.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 2),
                          child: Text('Store'),
                        )),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      _setFilterOption(true);
                    },
                    child: Container(
                        margin:
                            const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                        decoration: BoxDecoration(
                          color: isOwnedSelected
                              ? Colors.black26
                              : Colors.black26.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 2),
                          child: Text('Owned'),
                        )),
                  ),
                ]),
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: const Border(
                          top: BorderSide(width: 1, color: Colors.black26),
                          bottom: BorderSide(width: 1, color: Colors.black26),
                          right: BorderSide(width: 1, color: Colors.black26),
                          left: BorderSide(width: 1, color: Colors.black26),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Row(children: [
                          Icon(
                            Icons.money,
                            color: Colors.amber.shade300,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('50')
                        ]),
                      )),
                  const SizedBox(height: 5),
                  Text('Available Slinkcoins',
                      style: TextStyle(
                          fontSize: 11, color: Colors.black.withOpacity(0.7)))
                ],
              )
            ],
          ),
        ),
        skins.isNotEmpty || _controller.text.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: skins.length,
                    itemBuilder: (context, index) =>
                        SkinCard(index: index, listSkins: skins)),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: skinsList.length,
                    itemBuilder: (context, index) => SkinCard(
                          index: index,
                          listSkins: skinsList,
                        ))),
      ],
    );
  }
}

class SkinCard extends StatefulWidget {
  final int index;
  final List<SkinModel> listSkins;

  const SkinCard({
    Key? key,
    required this.index,
    required this.listSkins,
  }) : super(key: key);

  @override
  _SkinCardState createState() => _SkinCardState();
}

class _SkinCardState extends State<SkinCard> {
  int index = 0;
  List<PaletteColor> colors = [];
  List<Color> textColors = [];
  List<Color> defaultColors = [Colors.black12, Colors.black26];

  @override
  void initState() {
    index = widget.index;
    colors = [];
    _updateColorPallet();
    super.initState();
  }

  _updateColorPallet() async {
    final generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageList[index]),
    );

    colors.add(generator.lightMutedColor ?? PaletteColor(Colors.black12, 2));
    colors.add(generator.dominantColor ?? PaletteColor(Colors.black12, 2));
    colors.add(generator.dominantColor ?? PaletteColor(Colors.black12, 2));

    textColors.add(generator.lightMutedColor!.titleTextColor);
    textColors.add(generator.lightMutedColor!.bodyTextColor);
    textColors.add(generator.vibrantColor!.titleTextColor);
    textColors.add(generator.vibrantColor!.bodyTextColor);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SingleSkin(
            currentSkin: widget.listSkins[index],
            primaryColor: colors[0],
          );
        }));
      },
      child: Column(children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 20,
                  right: 30,
                  bottom: 10,
                  top: MediaQuery.of(context).size.width / 7),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors.isNotEmpty ? colors[0].color : Colors.black12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.money_outlined,
                          color: Colors.amber.shade300,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          ' : ${widget.listSkins[index].skinValue}',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Text(widget.listSkins[index].skinName,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
                right: 20,
                top: 5,
                child: PhysicalModel(
                  color: Colors.black.withOpacity(0),
                  elevation: 0,
                  child: Image.network(
                      imageList[widget.listSkins[index].skinID - 1],
                      height: MediaQuery.of(context).size.width / 2.2,
                      width: MediaQuery.of(context).size.width / 2.2),
                ))
          ],
        )
      ]),
    );
  }
}
