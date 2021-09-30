import 'dart:convert';

class StatusModel {
  String statusHeading;
  String statusValue;
  StatusModel({
    required this.statusHeading,
    required this.statusValue,
  });

  StatusModel copyWith({
    String? statusHeading,
    String? statusValue,
  }) {
    return StatusModel(
      statusHeading: statusHeading ?? this.statusHeading,
      statusValue: statusValue ?? this.statusValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statusHeading': statusHeading,
      'statusValue': statusValue,
    };
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      statusHeading: map['statusHeading'],
      statusValue: map['statusValue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) =>
      StatusModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'StatusModel(statusHeading: $statusHeading, statusValue: $statusValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatusModel &&
        other.statusHeading == statusHeading &&
        other.statusValue == statusValue;
  }

  @override
  int get hashCode => statusHeading.hashCode ^ statusValue.hashCode;
}
