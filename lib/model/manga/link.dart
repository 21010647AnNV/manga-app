class Links {
  final String amz;

  Links({
    required this.amz,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    final amz = json['amz'] ?? '';
    return Links(amz: amz);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amz'] = amz;

    return data;
  }
}
