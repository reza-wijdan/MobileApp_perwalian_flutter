class SendMatkul {
  final int id;

  SendMatkul({required this.id});

   Map<int, dynamic> toJson() {
    return {
      id: id,
    };
  }
}