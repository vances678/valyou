class AlignmentData {
  final DateTime dateTime;
  final double value;

  AlignmentData({
    required this.dateTime,
    required this.value,
  });

  factory AlignmentData.fromJson(Map<String, dynamic> json) {
    return AlignmentData(
      dateTime: json["dateTime"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dateTime": dateTime,
      "value": value,
    };
  }
}
