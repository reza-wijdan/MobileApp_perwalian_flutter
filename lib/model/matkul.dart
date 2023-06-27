class Matkul {
  final int id;
  final String name;
  final int sks;

  Matkul({required this.id, required this.name, required this.sks});

  factory Matkul.fromJson(Map<String, dynamic> json) {
    return Matkul(
      id: json['id'], 
      name: json['name'], 
      sks: json['sks']
    );
  }
}