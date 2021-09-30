import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:slingshot/utils.dart';

class SkinsPage extends StatefulWidget {
  const SkinsPage({Key? key}) : super(key: key);

  @override
  _SkinsPageState createState() => _SkinsPageState();
}

class _SkinsPageState extends State<SkinsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: imageList.length,
            itemBuilder: (context, index) => SkinCard(index: index)));
  }
}

class SkinCard extends StatefulWidget {
  final int index;

  const SkinCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _SkinCardState createState() => _SkinCardState();
}

class _SkinCardState extends State<SkinCard> {
  int index = 0;
  List<PaletteColor> colors = [];
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(children: [
        const SizedBox(height: 10),
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
                gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: colors.isNotEmpty
                        ? colors.map((e) => e.color).toList()
                        : defaultColors),
                color: colors.isNotEmpty ? colors[0].color : Colors.black12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Level : 6',
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Pokemon Name",
                        style: Theme.of(context).textTheme.headline4),
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
                  elevation: 50,
                  child: Image.network(imageList[index],
                      height: MediaQuery.of(context).size.width / 2.2,
                      width: MediaQuery.of(context).size.width / 2.2),
                ))
          ],
        )
      ]),
    );
  }
}
