import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:putins_instagram/constants.dart';
import 'package:putins_instagram/repo/currency_quota_repository.dart';

import 'data/with_annotations/currency_quota_dto.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class ConsumeApi {
  static final _dio = Dio();

  static const _apiKey = "d5dd8edb26dc5f55601c691bfa0902e4e08384ad";
  static const _currenciesIds = "BTC,ETH,XRP,SOL";
  static const _priceInterval = "ytd";
  static const _currencyConvertTo = "USD";

  static Future<List<CurrencyQuotaDto>> getData() {
    int a = 5;



    // sdfdsf



    RestClient client = RestClient(_dio);
    return client.getCurrenciesTicker(
      _apiKey,
      _currenciesIds,
      _priceInterval,
      _currencyConvertTo,
    );
  }
}

class _MainPageState extends State<MainPage> {
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
        child: FutureBuilder<List<CurrencyQuotaDto>>(
          future: ConsumeApi.getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("loading...");
            } else {
              return Text(snapshot.data!.first.price.toString());
            }
          },
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
