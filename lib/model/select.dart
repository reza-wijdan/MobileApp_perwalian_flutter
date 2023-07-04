class SelectedItem {
  final int id;
  final String name;
  final int sks;

  SelectedItem({required this.id, required this.name, required this.sks});

  @override
  String toString() {
    return '$id';
  }
}