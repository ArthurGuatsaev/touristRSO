class AfishaModel {
  final String mainCategory;
  final String playsId;
  String? webAdress;
  final String name;
  final String image;
  DateTime? date;
  final String adress;
  final int priority;
  AfishaModel({this.mainCategory = '', this.priority = 0, this.playsId = '', this.name = '', this.image = '', this.date, this.adress = '', this.webAdress});
  AfishaModel copyWith({
    String? mainCategory,
    String? name,
    String? image,
    String? webAdress,
    DateTime? date,
    String? playsId,
    int? priority,
    String? adress
  }) {
    return AfishaModel(
      mainCategory: mainCategory ?? this.mainCategory,
      name: name ?? this.name,
      webAdress: webAdress ?? this.webAdress,
      adress: adress ?? this.adress,
      priority: priority ?? this.priority,
      playsId: playsId ?? this.playsId,
      image: image ?? this.image,
      date: date ?? this.date
    );
  }
}