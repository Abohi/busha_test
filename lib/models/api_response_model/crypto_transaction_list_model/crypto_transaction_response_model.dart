import 'package:busha_mobile_test/models/api_response_model/crypto_transaction_list_model/crypto_transaction_model.dart';
import 'package:busha_mobile_test/utils/parser_util.dart';

class CryptoTransactionResponseModel {
  final List<CryptoTransactionModel>? tx;
  CryptoTransactionResponseModel({
    required this.tx,
  });

  factory CryptoTransactionResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return CryptoTransactionResponseModel(
      tx: ParserUtil<CryptoTransactionModel>().parseJsonList(
          json: json["tx"],
          isLimitTransactions: true,
          fromJson: (json) {
            return CryptoTransactionModel.fromJson(json);
          }),
    );
  }
}
