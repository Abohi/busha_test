import 'package:busha_mobile_test/utils/_export_.dart';

class BlockChainBlockResponseModel {
  final String? hash;
  BlockChainBlockResponseModel({
    required this.hash,
  });

  factory BlockChainBlockResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return BlockChainBlockResponseModel(
        hash: ParserUtil.parseJsonString(json, 'hash'));
  }
}
