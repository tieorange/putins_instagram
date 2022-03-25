// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_quota_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyQuotaDto _$CurrencyQuotaDtoFromJson(Map<String, dynamic> json) {
  return CurrencyQuotaDto(
    id: json['id'] as String,
    currency: json['currency'] as String,
    symbol: json['symbol'] as String,
    name: json['name'] as String,
    logoUrl: json['logo_url'] as String,
    status: json['status'] as String,
    price: json['price'] as String,
    priceDate: json['price_date'] as String,
    priceTimestamp: json['price_timestamp'] as String,
    marketCap: json['market_cap'] as String,
    marketCapDominance: json['market_cap_dominance'] as String,
    numExchanges: json['num_exchanges'] as String,
    numPairs: json['num_pairs'] as String,
    numPairsUnmapped: json['num_pairs_unmapped'] as String,
    firstCandle: json['first_candle'] as String,
    firstTrade: json['first_trade'] as String,
    firstOrderBook: json['first_order_book'] as String,
    rank: json['rank'] as String,
    rankDelta: json['rank_delta'] as String,
    high: json['high'] as String,
    highTimestamp: json['high_timestamp'] as String,
    ytd: Ytd.fromJson(json['ytd'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyQuotaDtoToJson(CurrencyQuotaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'symbol': instance.symbol,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'status': instance.status,
      'price': instance.price,
      'price_date': instance.priceDate,
      'price_timestamp': instance.priceTimestamp,
      'market_cap': instance.marketCap,
      'market_cap_dominance': instance.marketCapDominance,
      'num_exchanges': instance.numExchanges,
      'num_pairs': instance.numPairs,
      'num_pairs_unmapped': instance.numPairsUnmapped,
      'first_candle': instance.firstCandle,
      'first_trade': instance.firstTrade,
      'first_order_book': instance.firstOrderBook,
      'rank': instance.rank,
      'rank_delta': instance.rankDelta,
      'high': instance.high,
      'high_timestamp': instance.highTimestamp,
      'ytd': instance.ytd,
    };

Ytd _$YtdFromJson(Map<String, dynamic> json) {
  return Ytd(
    volume: json['volume'] as String,
    priceChange: json['price_change'] as String,
    priceChangePct: json['price_change_pct'] as String,
    volumeChange: json['volume_change'] as String,
    volumeChangePct: json['volume_change_pct'] as String,
    marketCapChange: json['market_cap_change'] as String,
    marketCapChangePct: json['market_cap_change_pct'] as String,
  );
}

Map<String, dynamic> _$YtdToJson(Ytd instance) => <String, dynamic>{
      'volume': instance.volume,
      'price_change': instance.priceChange,
      'price_change_pct': instance.priceChangePct,
      'volume_change': instance.volumeChange,
      'volume_change_pct': instance.volumeChangePct,
      'market_cap_change': instance.marketCapChange,
      'market_cap_change_pct': instance.marketCapChangePct,
    };
