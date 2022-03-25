import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
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
  static const _currenciesIds = "";

  // static const _currenciesIds = "BTC,ETH,XRP,SOL,BNB";
  // static const _currenciesIds = "BTC,ETH,XRP,SOL";
  static const _priceInterval = "ytd";
  static const _currencyConvertTo = "USD";

  static Future<List<CurrencyQuotaDto>> getData() {
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
  static final logger = Logger();

  /*@override
  initState(){
    name();
  }

  Future<void> name() async {
    await ConsumeApi.getData();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<CurrencyQuotaDto>>(
        future: ConsumeApi.getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text('Loading....'));
            default:
              if (snapshot.hasError) {
                _MainPageState.logger.d(snapshot.error);
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                var data = snapshot.data ?? List.empty();
                _MainPageState.logger.d(data);

                final list = ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Center(
                                    child: SvgPicture.network(
                                      item.logoUrl,
                                      width: 30,
                                      height: 30,
                                      semanticsLabel: 'A shark?!',
                                      placeholderBuilder:
                                          (BuildContext context) => Container(
                                              width: 30,
                                              height: 30,
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child:
                                                  const CircularProgressIndicator()),
                                    ),
                                  ),
                                  Text(item.name),
                                ],
                              ),
                              Text("Price: ${item.price} \$"),
                            ],
                          ),
                        ),
                      );
                    });

                return list;
              }
          }
        },
      ),
    );
  }

  FutureBuilder<List<CurrencyQuotaDto>> buildFutureBuilder() {
    return FutureBuilder<List<CurrencyQuotaDto>>(
      future: ConsumeApi.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading....');
          default:
            if (snapshot.hasError) {
              logger.d(snapshot.error);
              return Text("Error: ${snapshot.error}");
            } else {
              logger.d(snapshot.data);
              return Text(snapshot.data!.first.price.toString());
            }
        }
      },
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
