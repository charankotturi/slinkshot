import 'dart:convert';

class SkinModel {
  String skinName;
  int skinID;
  int skinValue;
  SkinModel({
    required this.skinName,
    required this.skinID,
    required this.skinValue,
  });

  SkinModel copyWith({
    String? skinName,
    int? skinID,
    int? skinValue,
  }) {
    return SkinModel(
      skinName: skinName ?? this.skinName,
      skinID: skinID ?? this.skinID,
      skinValue: skinValue ?? this.skinValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'skinName': skinName,
      'skinID': skinID,
      'skinValue': skinValue,
    };
  }

  factory SkinModel.fromMap(Map<String, dynamic> map) {
    return SkinModel(
      skinName: map['skinName'],
      skinID: map['skinID'],
      skinValue: map['skinValue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SkinModel.fromJson(String source) =>
      SkinModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SkinModel(skinName: $skinName, skinID: $skinID, skinValue: $skinValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SkinModel &&
        other.skinName == skinName &&
        other.skinID == skinID &&
        other.skinValue == skinValue;
  }

  @override
  int get hashCode => skinName.hashCode ^ skinID.hashCode ^ skinValue.hashCode;
}
