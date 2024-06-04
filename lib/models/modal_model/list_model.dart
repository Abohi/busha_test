class ListModel {
  final String name;
  final int id;
  ListModel({required this.name, required this.id});
  Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
      };
}
