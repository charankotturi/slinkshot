import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:slingshot/post_page.dart';
import 'package:slingshot/profile.dart';
import 'package:slingshot/skins.dart';
import 'package:slingshot/utils.dart';
import 'package:slingshot/video_widget.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  _currentIndexFun(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages = [
    const HomepageInit(),
    const SkinsPage(),
    const MyProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _currentIndexFun,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shield_outlined), label: 'Skin'),
          BottomNavigationBarItem(
              icon: Icon(Icons.face_rounded), label: 'Profile')
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}

class HomepageInit extends StatefulWidget {
  const HomepageInit({Key? key}) : super(key: key);

  @override
  _HomepageInitState createState() => _HomepageInitState();
}

class _HomepageInitState extends State<HomepageInit> {
  List<bool> isSelectedList = List.filled(mainTags.length, false);
  final PageController controller = PageController(initialPage: 0);

  void _isSelected(int index) {
    for (var i = 0; i < isSelectedList.length; i++) {
      if (index == i) {
        setState(() {
          isSelectedList[index] = !isSelectedList[index];
        });
      } else {
        setState(() {
          isSelectedList[i] = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Text('SlinkShot', style: Theme.of(context).textTheme.headline6),
              Expanded(child: Container()),
              IconButton(icon: const Icon(Icons.archive), onPressed: () {}),
              const SizedBox(
                width: 10,
              ),
              IconButton(icon: const Icon(Icons.send), onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mainTags.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        _isSelected(index);
                      },
                      child: FilterCard(
                          index: index, isSelected: isSelectedList[index]));
                }),
          ),
          Expanded(
              child: PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            children: [
              for (var i = 0; i < imageAndVideoString.length; i++)
                PostWidget(networkUrl: imageAndVideoString[i])
            ],
          ))
        ],
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  const FilterCard({Key? key, required this.index, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: isSelected == false
            ? Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Center(
                    child: Text(
                      mainTags[index],
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                decoration: kInnerDecoration)
            : Container(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: Center(
                        child: Text(
                          mainTags[index],
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    decoration: kInnerDecoration,
                  ),
                ),
                decoration: kGradientBoxDecoration(
                    colors: [Colors.red.shade900, Colors.blue.shade900])));
  }
}
