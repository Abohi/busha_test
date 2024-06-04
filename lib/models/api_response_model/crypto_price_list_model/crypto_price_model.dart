import 'package:busha_mobile_test/utils/_export_.dart';

class CryptoPriceModel {
  final String? id;
  final String? icon;
  final double? price;
  final String? name;
  final double? change24h;
  final String? ticker;
  CryptoPriceModel({
    required this.name,
    required this.id,
    required this.price,
    required this.change24h,
    required this.icon,
    required this.ticker,
  });

  factory CryptoPriceModel.fromJson(Map<String, dynamic> json) {
    return CryptoPriceModel(
      name: ParserUtil.parseJsonString(json, 'name'),
      id: ParserUtil.parseJsonString(json, 'id'),
      price: ParserUtil.parseJsonDouble(json, 'price'),
      change24h: ParserUtil.parseJsonDouble(json, 'change24h'),
      icon: ParserUtil.parseJsonString(json, 'icon'),
      ticker: ParserUtil.parseJsonString(json, 'ticker'),
    );
  }
}
