import 'package:busha_mobile_test/core/services/config/_export_.dart';
import 'package:busha_mobile_test/core/services/remote/endpoints/_export_.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DashBoardRepository {
  DashBoardRepository() : super();

  Future<GeneralResponse> getCryptoPriceList() async {
    var res = await ApiRequestHelpers(
            dio: locator(),
            baseUrl: dotenv.env['BASE_URL_BLOCK_CHAIN_EXPLORER']!)
        .get(
      ApiEndpoints.cryptoPriceListRoute,
    );

    return GeneralResponse.fromJson(res);
  }

  Future<GeneralResponse> getBlockChainBlockInfo(
      {required String blockHash}) async {
    var res = await ApiRequestHelpers(
            dio: locator(), baseUrl: dotenv.env['BASE_URL_BLOCK_CHAIN_INFO']!)
        .get("${ApiEndpoints.getblockChainBlockInfoRoute}$blockHash",
            isFetchDataInIsolate: true);

    return GeneralResponse.fromJson(res);
  }

  Future<GeneralResponse> getLatestBlockChainBlock() async {
    var res = await ApiRequestHelpers(
            dio: locator(), baseUrl: dotenv.env['BASE_URL_BLOCK_CHAIN_INFO']!)
        .get(
      ApiEndpoints.getblockRoute,
    );

    return GeneralResponse.fromJson(res);
  }
}
