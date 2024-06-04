import 'package:busha_mobile_test/utils/parser_util.dart';

class CryptoTransactionModel {
  final String? hash;
  final double? size;
  final double? blockHeight;
  final double? blockIndex;
  final int? time;

  CryptoTransactionModel({
    required this.hash,
    required this.blockHeight,
    required this.blockIndex,
    required this.size,
    required this.time,
  });

  factory CryptoTransactionModel.fromJson(Map<String, dynamic> json) {
    return CryptoTransactionModel(
      hash: ParserUtil.parseJsonString(json, 'hash'),
      blockHeight: ParserUtil.parseJsonDouble(json, 'block_height'),
      blockIndex: ParserUtil.parseJsonDouble(json, 'block_index'),
      size: ParserUtil.parseJsonDouble(json, 'size'),
      time: ParserUtil.parseJsonInt(json, 'time'),
    );
  }
}
