import 'dart:math';

import 'package:flutter/material.dart';
import 'package:putins_instagram/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Hero(
            tag: "InstaLogo",
            child: Image.network(Constants.instagramLogoUrl),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: buildImagesList(),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView(
      children: buildImagesList(),
    );
  }

  Random random = Random();

  List<Widget> buildImagesList() {
    final list = List.generate(
      30,
      (index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 200,
                width: 410,
                child: Image.network(
                  'https://picsum.photos/${getNextImageSizeRandom()}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        );
      },
    );

    list.first = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            height: 200,
            width: 410,
            child: Image.network(
                'https://i.ytimg.com/vi/SwgEhz3nwv8/maxresdefault.jpg'),
          ),
        ),
      ],
    );

    return list;
  }

  int getNextImageSizeRandom() => random.nextInt(150) + 100;
}
