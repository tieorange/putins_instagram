import 'dart:ffi';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        backgroundColor: Colors.deepPurple,
        title: const Text("Crypto Scanner"),
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

                      String price = item.price.toPrecision(3).toString();
                      String high = item.high.toPrecision(3).toString();
                      String dateHigh =
                          DateTime.parse(item.highTimestamp).formatDDMMYY();

                      return CurrencyItem(item: item, price: price, high: high, dateHigh: dateHigh);
                    });

                return list;
              }
          }
        },
      ),
    );
  }
}

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    Key? key,
    required this.item,
    required this.price,
    required this.high,
    required this.dateHigh,
  }) : super(key: key);

  final CurrencyQuotaDto item;
  final String price;
  final String high;
  final String dateHigh;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SvgJpgCachedImage(item: item),
                ),
                Text("${item.symbol} - ",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text(item.name,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Chip(
                backgroundColor: Colors.green[50],
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.paid, size: 25),
                    Text(
                      " Price: $price",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 8),
            Row(
              children: [
                const Icon(Icons.arrow_upward, size: 25),
                Text(
                  " Highest: $high ($dateHigh)",
                  style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Container(height: 8),
            Row(
              children: [
                const Icon(Icons.all_inclusive, size: 25),
                Text(
                  " Market cap: ${item.marketCap}\$",
                  style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SvgJpgCachedImage extends StatelessWidget {
  const SvgJpgCachedImage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CurrencyQuotaDto item;

  @override
  Widget build(BuildContext context) {
    var url = item.logoUrl;
    if (!url.endsWith("svg")) {
      return CachedNetworkImage(
        imageUrl: url,
        width: 40,
        height: 40,
        placeholder: (context, url) => const SvgJpgCachedImagePlaceholder(),
      );
    }

    return SvgPicture.network(
      url,
      width: 40,
      height: 40,
      semanticsLabel: 'A shark?!',
      placeholderBuilder: (BuildContext context) =>
          const SvgJpgCachedImagePlaceholder(),
    );
  }
}

class SvgJpgCachedImagePlaceholder extends StatelessWidget {
  const SvgJpgCachedImagePlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator());
  }
}

extension RoundDouble on String {
  double toPrecision(int precision) {
    var doubleValue = double.parse(this);
    return double.parse(doubleValue.toStringAsFixed(precision));
  }
}

extension DateTimeExtension on DateTime {
  String formatDDMMYY() => "$day.$month.$year";
}
