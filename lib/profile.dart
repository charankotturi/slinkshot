import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slingshot/status_model.dart';
import 'utils.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with TickerProviderStateMixin {
  List<StatusModel>? statues;
  bool isGrid = true;

  @override
  void initState() {
    final _status1 =
        StatusModel(statusHeading: 'Following', statusValue: '200');
    final _status2 =
        StatusModel(statusHeading: 'Connections', statusValue: '150');
    final _status3 =
        StatusModel(statusHeading: 'Slinkshots', statusValue: '6969');

    statues = [];
    statues!.add(_status1);
    statues!.add(_status2);
    statues!.add(_status3);

    super.initState();
  }

  void toggleGridView(bool value) {
    setState(() {
      isGrid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constrains) {
        return Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, bottom: 20, top: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My Profile',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Icon(Icons.circle,
              //         size: MediaQuery.of(context).size.width / 3.25),
              //     Image.network(
              //       imageList[3],
              //       height: MediaQuery.of(context).size.width / 3,
              //       width: MediaQuery.of(context).size.width / 3,
              //     ),
              //   ],
              // ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageList[4])),
                    borderRadius: BorderRadius.all(
                        Radius.circular(MediaQuery.of(context).size.width / 3)),
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Avacado Peach',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                child: Text(
                  'Somthign which is totally relavent to the topic which is the game we are playing right now and i would love to play teh game and enjoy its gaming experience.',
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  for (var status in statues!)
                    statusContainer(
                        context, status.statusHeading, status.statusValue)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        toggleGridView(true);
                      },
                      child: Icon(
                        Icons.grid_on,
                        color: isGrid ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        toggleGridView(false);
                      },
                      child: Icon(Icons.list_alt,
                          color: !isGrid ? Colors.black : Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                      height: 1),
                  Transform.translate(
                    offset: isGrid
                        ? const Offset(0, 0)
                        : Offset(MediaQuery.of(context).size.width / 2, 0),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: Colors.black,
                        height: 1.2),
                  ),
                ],
              ),
              isGrid
                  ? Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: List.generate(imageList.length, (index) {
                          return Image.network(imageList[index],
                              fit: BoxFit.cover);
                        }),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: imageList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                color: Colors.black,
                                height: 250,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 180,
                                      child: Image.network(imageList[index],
                                          fit: BoxFit.scaleDown),
                                    ),
                                    const Expanded(
                                        child: Center(
                                      child: Text('Post Name',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            ],
          ),
        );
      },
    ));
  }
}

Widget statusContainer(
    BuildContext context, String statusHeading, String statusValue) {
  return Expanded(
    child: Column(
      children: [
        Text(
          statusHeading,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
        Text(
          statusValue,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    flex: 1,
  );
}
