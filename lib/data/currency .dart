import 'dart:convert';

import 'package:putins_instagram/data/safe_convert.dart';

convertJsonToCurrency(String jsonStr) {
  final jsonList = json.decode(jsonStr) as List;
  final list = jsonList.map((e) => CurrencyItem.fromJson(e)).toList();

  return list;
}

class CurrencyItem {
  final String id;
  final String currency;
  final String symbol;
  final String name;
  final String logoUrl;
  final String status;
  final String price;
  final String priceDate;
  final String priceTimestamp;
  final String circulatingSupply;
  final String maxSupply;
  final String marketCap;
  final String marketCapDominance;
  final String numExchanges;
  final String numPairs;
  final String numPairsUnmapped;
  final String firstCandle;
  final String firstTrade;
  final String firstOrderBook;
  final String rank;
  final String rankDelta;
  final String high;
  final String highTimestamp;
  final Ytd ytd;
  final String platformCurrency;

  CurrencyItem({
    this.id = "",
    this.currency = "",
    this.symbol = "",
    this.name = "",
    this.logoUrl = "",
    this.status = "",
    this.price = "",
    this.priceDate = "",
    this.priceTimestamp = "",
    this.circulatingSupply = "",
    this.maxSupply = "",
    this.marketCap = "",
    this.marketCapDominance = "",
    this.numExchanges = "",
    this.numPairs = "",
    this.numPairsUnmapped = "",
    this.firstCandle = "",
    this.firstTrade = "",
    this.firstOrderBook = "",
    this.rank = "",
    this.rankDelta = "",
    this.high = "",
    this.highTimestamp = "",
    required this.ytd,
    this.platformCurrency = "",
  });

  factory CurrencyItem.fromJson(Map<String, dynamic>? json) => CurrencyItem(
        id: asString(json, 'id'),
        currency: asString(json, 'currency'),
        symbol: asString(json, 'symbol'),
        name: asString(json, 'name'),
        logoUrl: asString(json, 'logo_url'),
        status: asString(json, 'status'),
        price: asString(json, 'price'),
        priceDate: asString(json, 'price_date'),
        priceTimestamp: asString(json, 'price_timestamp'),
        circulatingSupply: asString(json, 'circulating_supply'),
        maxSupply: asString(json, 'max_supply'),
        marketCap: asString(json, 'market_cap'),
        marketCapDominance: asString(json, 'market_cap_dominance'),
        numExchanges: asString(json, 'num_exchanges'),
        numPairs: asString(json, 'num_pairs'),
        numPairsUnmapped: asString(json, 'num_pairs_unmapped'),
        firstCandle: asString(json, 'first_candle'),
        firstTrade: asString(json, 'first_trade'),
        firstOrderBook: asString(json, 'first_order_book'),
        rank: asString(json, 'rank'),
        rankDelta: asString(json, 'rank_delta'),
        high: asString(json, 'high'),
        highTimestamp: asString(json, 'high_timestamp'),
        ytd: Ytd.fromJson(asMap(json, 'ytd')),
        platformCurrency: asString(json, 'platform_currency'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'currency': currency,
        'symbol': symbol,
        'name': name,
        'logo_url': logoUrl,
        'status': status,
        'price': price,
        'price_date': priceDate,
        'price_timestamp': priceTimestamp,
        'circulating_supply': circulatingSupply,
        'max_supply': maxSupply,
        'market_cap': marketCap,
        'market_cap_dominance': marketCapDominance,
        'num_exchanges': numExchanges,
        'num_pairs': numPairs,
        'num_pairs_unmapped': numPairsUnmapped,
        'first_candle': firstCandle,
        'first_trade': firstTrade,
        'first_order_book': firstOrderBook,
        'rank': rank,
        'rank_delta': rankDelta,
        'high': high,
        'high_timestamp': highTimestamp,
        'ytd': ytd.toJson(),
        'platform_currency': platformCurrency,
      };
}

class Ytd {
  final String volume;
  final String priceChange;
  final String priceChangePct;
  final String volumeChange;
  final String volumeChangePct;
  final String marketCapChange;
  final String marketCapChangePct;

  Ytd({
    this.volume = "",
    this.priceChange = "",
    this.priceChangePct = "",
    this.volumeChange = "",
    this.volumeChangePct = "",
    this.marketCapChange = "",
    this.marketCapChangePct = "",
  });

  factory Ytd.fromJson(Map<String, dynamic>? json) => Ytd(
        volume: asString(json, 'volume'),
        priceChange: asString(json, 'price_change'),
        priceChangePct: asString(json, 'price_change_pct'),
        volumeChange: asString(json, 'volume_change'),
        volumeChangePct: asString(json, 'volume_change_pct'),
        marketCapChange: asString(json, 'market_cap_change'),
        marketCapChangePct: asString(json, 'market_cap_change_pct'),
      );

  Map<String, dynamic> toJson() => {
        'volume': volume,
        'price_change': priceChange,
        'price_change_pct': priceChangePct,
        'volume_change': volumeChange,
        'volume_change_pct': volumeChangePct,
        'market_cap_change': marketCapChange,
        'market_cap_change_pct': marketCapChangePct,
      };
}
