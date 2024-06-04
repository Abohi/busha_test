import '../utils/_export_.dart';

class DialogDataModel {
  final GenericDialogActivityType genericDialogActivityType;
  final GenericDialogType genericDialogType;
  final Map<String, dynamic> dataMap;

  DialogDataModel({
    required this.genericDialogActivityType,
    required this.genericDialogType,
    required this.dataMap,
  });
}
