import '../../utils/_export_.dart';

class ModalListItemModel {
  String? imgUrl;
  String? title;
  String? description;
  String? code;
  int? id;

  ModalListItemModel(
      {required this.title,
      this.imgUrl,
      required this.id,
      this.description,
      this.code});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imgUrl': imgUrl,
      'id': id,
      'description': description,
      'code': code
    };
  }

  ///Convert parsed Json List and key Identifiers to `ModalListItemModel`
  factory ModalListItemModel.fromJson({
    required Map<String, dynamic> json,
    required String titleKey,
    required String idKey,
  }) {
    return ModalListItemModel(
      title: ParserUtil.parseJsonString(json, titleKey),
      id: ParserUtil.parseJsonInt(json, idKey),
      code: ParserUtil.parseJsonString(json, idKey),
    );
  }
}
