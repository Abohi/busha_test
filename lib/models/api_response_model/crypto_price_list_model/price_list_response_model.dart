import 'package:busha_mobile_test/models/api_response_model/crypto_price_list_model/page_props_model.dart';

class PriceListResponseModel {
  final PriceListPagePropsModel? pageProps;
  PriceListResponseModel({required this.pageProps});

  factory PriceListResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return PriceListResponseModel(
        pageProps: PriceListPagePropsModel.fromJson(json['pageProps']));
  }
}
