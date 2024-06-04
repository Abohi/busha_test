import 'package:busha_mobile_test/core/services/config/_export_.dart';
import 'package:busha_mobile_test/models/api_response_model/crypto_price_list_model/crypto_price_model.dart';
import 'package:busha_mobile_test/models/api_response_model/crypto_price_list_model/price_list_response_model.dart';
import 'package:busha_mobile_test/models/api_response_model/crypto_transaction_list_model/crypto_transaction_model.dart';
import 'package:busha_mobile_test/models/api_response_model/tezos_block/tezos_block_response_model.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '__export__.dart';

final dashboardChangeNotifier =
    ChangeNotifierProvider<DashboardNotifier>((ref) {
  return DashboardNotifier();
});

class DashboardNotifier extends BaseChangeNotifier {
  List<CryptoPriceModel> _cryptoPriceList = [];
  List<CryptoPriceModel> get cryptoPriceList => _cryptoPriceList;
  set cryptoPriceList(List<CryptoPriceModel> cryptoPriceList) {
    _cryptoPriceList = cryptoPriceList;
    notifyListeners();
  }

  List<TezosBlockResponseModel> _tezosBlockChainBlockInfoList = [];
  List<TezosBlockResponseModel> get tezosBlockChainBlockInfoList =>
      _tezosBlockChainBlockInfoList;
  set tezosBlockChainBlockInfoList(List<TezosBlockResponseModel> blockInfo) {
    _tezosBlockChainBlockInfoList = blockInfo;
    notifyListeners();
  }

  List<CryptoTransactionModel> _blockChainBlockInfoList = [];
  List<CryptoTransactionModel> get blockChainBlockInfoList =>
      _blockChainBlockInfoList;
  set blockChainBlockInfoList(List<CryptoTransactionModel> blockInfo) {
    _blockChainBlockInfoList = blockInfo;
    notifyListeners();
  }

  List<CryptoPriceModel> _cryptoTopMovers = [];
  List<CryptoPriceModel> get cryptoTopMovers => _cryptoTopMovers;
  set cryptoTopMovers(List<CryptoPriceModel> cryptoTopMovers) {
    _cryptoTopMovers = cryptoTopMovers;
    notifyListeners();
  }

  void getTopMovers() {
    if (cryptoPriceList.isNotEmpty) {
      List<CryptoPriceModel> topMoverList = [];
      int bitcoinIndex =
          cryptoPriceList.indexWhere((element) => element.id == 'bitcoin');
      int etherium =
          cryptoPriceList.indexWhere((element) => element.id == 'ethereum');
      int terzos =
          cryptoPriceList.indexWhere((element) => element.id == 'tezos');
      int solana =
          cryptoPriceList.indexWhere((element) => element.id == 'solana');
      if (bitcoinIndex != -1) {
        topMoverList.add(cryptoPriceList[bitcoinIndex]);
      }
      if (etherium != -1) {
        topMoverList.add(cryptoPriceList[etherium]);
      }
      if (terzos != -1) {
        topMoverList.add(cryptoPriceList[terzos]);
      }
      if (solana != -1) {
        topMoverList.add(cryptoPriceList[solana]);
      }
      cryptoTopMovers = topMoverList;
    } else {
      cryptoTopMovers = [];
    }
    notifyListeners();
  }

  Future<void> getCryptoPriceList({
    bool executeWithIndicator = true,
  }) async {
    try {
      // Show Progress Dialog
      isLoading = true;
      if (executeWithIndicator) dialogHandler.showGlobalProgressIndicator();

      final res = await dashBoardRepositories.getCryptoPriceList();

      if (res.success) {
        var responseData = res.data!;
        cryptoPriceList = PriceListResponseModel.fromJson(responseData)
                .pageProps
                ?.priceData ??
            [];
        isLoading = false;
        if (executeWithIndicator) await dialogHandler.dismissDialog();
      } else {
        isLoading = false;

        if (executeWithIndicator) await dialogHandler.dismissDialog();
        handleError(message: res.error!.data.toString());
      }
    } catch (e) {
      isLoading = false;
      if (executeWithIndicator) await dialogHandler.dismissDialog();
      handleError(message: e.toString());
    }
  }

  static List<dynamic> processTransactions(dynamic data) {
    final List<dynamic> allTransactions = data['tx'];
    const int limit = 10;
    return allTransactions.take(limit).toList();
  }

  Future<String> getblockChainBlockInfo({
    bool executeWithIndicator = true,
  }) async {
    try {
      final blockRes = await dashBoardRepositories.getLatestBlockChainBlock();
      if (blockRes.data != null) {
        return blockRes.data!["hash"];
      } else {
        return "";
      }
    } catch (e) {
      handleError(message: e.toString());
      return "";
    }
  }

  void handleError({
    ApiErrorResponse? response,
    String? message,
    bool shouldDisplayError = true,
  }) {
    isLoading = false;
    var shouldShowError = response?.shouldDisplayError ?? shouldDisplayError;
    if (shouldShowError) {
      showToastMessage(
        message: message != "null" ? message.toString() : "An error occured",
        responseMessageType: ResponseMessageType.failure,
      );
    }
  }
}
