import 'package:json_annotation/json_annotation.dart';

part 'currency_quota_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CurrencyQuotaDto {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'currency')
  String currency;
  @JsonKey(name: 'symbol')
  String symbol;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'logo_url')
  String logoUrl;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'price')
  String price;
  @JsonKey(name: 'price_date')
  String priceDate;
  @JsonKey(name: 'price_timestamp')
  String priceTimestamp;
  @JsonKey(name: 'market_cap')
  String marketCap;
  @JsonKey(name: 'market_cap_dominance')
  String marketCapDominance;
  @JsonKey(name: 'num_exchanges')
  String numExchanges;
  @JsonKey(name: 'num_pairs')
  String numPairs;
  @JsonKey(name: 'num_pairs_unmapped')
  String numPairsUnmapped;
  @JsonKey(name: 'first_candle')
  String firstCandle;
  @JsonKey(name: 'first_trade')
  String firstTrade;
  @JsonKey(name: 'first_order_book')
  String firstOrderBook;
  @JsonKey(name: 'rank')
  String rank;
  @JsonKey(name: 'rank_delta')
  String rankDelta;
  @JsonKey(name: 'high')
  String high;
  @JsonKey(name: 'high_timestamp')
  String highTimestamp;
  @JsonKey(name: 'ytd')
  Ytd ytd;

  CurrencyQuotaDto(
      {required this.id,
      required this.currency,
      required this.symbol,
      required this.name,
      required this.logoUrl,
      required this.status,
      required this.price,
      required this.priceDate,
      required this.priceTimestamp,
      required this.marketCap,
      required this.marketCapDominance,
      required this.numExchanges,
      required this.numPairs,
      required this.numPairsUnmapped,
      required this.firstCandle,
      required this.firstTrade,
      required this.firstOrderBook,
      required this.rank,
      required this.rankDelta,
      required this.high,
      required this.highTimestamp,
      required this.ytd});

  factory CurrencyQuotaDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyQuotaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyQuotaDtoToJson(this);

  @override
  String toString() {
    return "CurrencyQuotaDto{name: $name, price: $price "
        "URL: $logoUrl}";
  }
}

@JsonSerializable(ignoreUnannotated: false)
class Ytd {
  @JsonKey(name: 'volume')
  String volume;
  @JsonKey(name: 'price_change')
  String priceChange;
  @JsonKey(name: 'price_change_pct')
  String priceChangePct;

  Ytd(
      {required this.volume,
      required this.priceChange,
      required this.priceChangePct,});

  factory Ytd.fromJson(Map<String, dynamic> json) => _$YtdFromJson(json);

  Map<String, dynamic> toJson() => _$YtdToJson(this);
}
