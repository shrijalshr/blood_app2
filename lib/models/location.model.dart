// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationModel {
  final int? id;
  final String? name;
  const LocationModel({
    this.id,
    this.name,
  });

  LocationModel copyWith({
    int? id,
    String? name,
  }) {
    return LocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocationModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
