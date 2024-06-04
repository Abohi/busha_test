import 'package:busha_mobile_test/utils/parser_util.dart';

class TezosBlockResponseModel {
  final int? level;
  final String? hash;
  final String? timestamp;
  final int? bonus;
  final int? reward;
  final int? fees;
  TezosBlockResponseModel({
    required this.hash,
    required this.bonus,
    required this.timestamp,
    required this.level,
    required this.reward,
    required this.fees,
  });

  factory TezosBlockResponseModel.fromJson(Map<String, dynamic> json) {
    return TezosBlockResponseModel(
      hash: ParserUtil.parseJsonString(json, 'hash'),
      timestamp: ParserUtil.parseJsonString(json, 'timestamp'),
      bonus: ParserUtil.parseJsonInt(json, 'time'),
      level: ParserUtil.parseJsonInt(json, 'level'),
      reward: ParserUtil.parseJsonInt(json, 'reward'),
      fees: ParserUtil.parseJsonInt(json, 'fees'),
    );
  }
}
