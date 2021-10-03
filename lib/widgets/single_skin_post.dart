import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:slingshot/models/skin_model.dart';
import 'package:slingshot/utils.dart';

class SingleSkin extends StatefulWidget {
  final SkinModel currentSkin;
  final PaletteColor primaryColor;
  final bool? isSkinPage;
  const SingleSkin(
      {Key? key,
      required this.currentSkin,
      required this.primaryColor,
      this.isSkinPage})
      : super(key: key);

  @override
  _SingleSkinState createState() => _SingleSkinState();
}

class _SingleSkinState extends State<SingleSkin> {
  late Color titleColor;
  late Color bodyColor;
  late bool isSkinPage;

  @override
  void initState() {
    isSkinPage = widget.isSkinPage ?? true;

    try {
      titleColor = widget.primaryColor.titleTextColor;
    } catch (e) {
      titleColor = Colors.white70;
    }
    try {
      bodyColor = widget.primaryColor.bodyTextColor;
    } catch (e) {
      bodyColor = Colors.white70;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.primaryColor.color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: titleColor)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.currentSkin.skinName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                Theme.of(context).textTheme.headline5!.fontSize,
                            color: titleColor)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.network(
                  imageList[widget.currentSkin.skinID - 1],
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(sampleDescription,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight:
                        Theme.of(context).textTheme.subtitle1!.fontWeight,
                    fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                    color: bodyColor,
                  )),
            ),
            isSkinPage
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MaterialButton(
                        color: titleColor.withOpacity(0.2),
                        height: 50,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Buy at '),
                            Icon(
                              Icons.money_outlined,
                              color: Colors.amber.shade300,
                            ),
                            Text(' : ${widget.currentSkin.skinValue}'),
                          ],
                        )),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
