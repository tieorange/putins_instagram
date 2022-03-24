import 'Ytd.dart';

class CryptoPriceClass {
  String? id;
  String? currency;
  String? symbol;
  String? name;
  String? logoUrl;
  String? status;
  String? price;
  String? priceDate;
  String? priceTimestamp;
  String? circulatingSupply;
  String? maxSupply;
  String? marketCap;
  String? marketCapDominance;
  String? numExchanges;
  String? numPairs;
  String? numPairsUnmapped;
  String? firstCandle;
  String? firstTrade;
  String? firstOrderBook;
  String? rank;
  String? rankDelta;
  String? high;
  String? highTimestamp;
  Ytd? ytd;

  CryptoPriceClass(
      {this.id,
      this.currency,
      this.symbol,
      this.name,
      this.logoUrl,
      this.status,
      this.price,
      this.priceDate,
      this.priceTimestamp,
      this.circulatingSupply,
      this.maxSupply,
      this.marketCap,
      this.marketCapDominance,
      this.numExchanges,
      this.numPairs,
      this.numPairsUnmapped,
      this.firstCandle,
      this.firstTrade,
      this.firstOrderBook,
      this.rank,
      this.rankDelta,
      this.high,
      this.highTimestamp,
      this.ytd});

  CryptoPriceClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    symbol = json['symbol'];
    name = json['name'];
    logoUrl = json['logo_url'];
    status = json['status'];
    price = json['price'];
    priceDate = json['price_date'];
    priceTimestamp = json['price_timestamp'];
    circulatingSupply = json['circulating_supply'];
    maxSupply = json['max_supply'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    numExchanges = json['num_exchanges'];
    numPairs = json['num_pairs'];
    numPairsUnmapped = json['num_pairs_unmapped'];
    firstCandle = json['first_candle'];
    firstTrade = json['first_trade'];
    firstOrderBook = json['first_order_book'];
    rank = json['rank'];
    rankDelta = json['rank_delta'];
    high = json['high'];
    highTimestamp = json['high_timestamp'];
    ytd = json['ytd'] != null ? new Ytd.fromJson(json['ytd']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    data['status'] = this.status;
    data['price'] = this.price;
    data['price_date'] = this.priceDate;
    data['price_timestamp'] = this.priceTimestamp;
    data['circulating_supply'] = this.circulatingSupply;
    data['max_supply'] = this.maxSupply;
    data['market_cap'] = this.marketCap;
    data['market_cap_dominance'] = this.marketCapDominance;
    data['num_exchanges'] = this.numExchanges;
    data['num_pairs'] = this.numPairs;
    data['num_pairs_unmapped'] = this.numPairsUnmapped;
    data['first_candle'] = this.firstCandle;
    data['first_trade'] = this.firstTrade;
    data['first_order_book'] = this.firstOrderBook;
    data['rank'] = this.rank;
    data['rank_delta'] = this.rankDelta;
    data['high'] = this.high;
    data['high_timestamp'] = this.highTimestamp;
    if (this.ytd != null) {
      data['ytd'] = this.ytd!.toJson();
    }
    return data;
  }
}
