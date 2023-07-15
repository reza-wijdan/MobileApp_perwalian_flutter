class SendMatkul {
  final List<int> list_matakuliah;
  SendMatkul({required this.list_matakuliah});

  Map<String, dynamic> toJson() {
    return {
      'list_matakuliah': list_matakuliah,
    };
  }
}
