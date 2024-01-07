class Facility {
  Facility({
    required this.name,
    required this.imagePath,
    required this.discription,
  });
  late String name;
  late String imagePath;
  late String discription;

  Facility.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    imagePath = json['imagePath'] ?? '';
    discription = json['discription'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    data['discription'] = discription;
    return data;
  }
}