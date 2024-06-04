import 'package:busha_mobile_test/models/api_response_model/crypto_price_list_model/crypto_price_model.dart';

import '../../../utils/_export_.dart';

class PriceListPagePropsModel {
  final List<CryptoPriceModel>? priceData;

  PriceListPagePropsModel({required this.priceData});

  factory PriceListPagePropsModel.fromJson(Map<String, dynamic> json) {
    return PriceListPagePropsModel(
        priceData: ParserUtil<CryptoPriceModel>().parseJsonList(
            json: json["priceData"],
            fromJson: (json) {
              return CryptoPriceModel.fromJson(json);
            }));
  }
}
