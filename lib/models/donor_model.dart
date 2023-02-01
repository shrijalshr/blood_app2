class DonorModel {
  DonorModel({
    this.id,
    this.phone,
    this.dob,
    this.address,
    this.location,
    this.bloodGroup,
    this.locationName,
    this.userId,
  });

  final int? id;
  final String? phone;
  final DateTime? dob;
  final String? address;
  final int? location;
  final String? bloodGroup;
  final String? locationName;
  final String? userId;

  DonorModel copyWith({
    int? id,
    String? phone,
    DateTime? dob,
    String? address,
    int? location,
    String? bloodGroup,
    String? locationName,
    String? userId,
  }) =>
      DonorModel(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        dob: dob ?? this.dob,
        address: address ?? this.address,
        location: location ?? this.location,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        locationName: locationName ?? this.locationName,
        userId: userId ?? this.userId,
      );

  factory DonorModel.fromJson(Map<String, dynamic> json) => DonorModel(
        id: json["id"],
        phone: json["phone"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        address: json["address"],
        location: json["location"],
        bloodGroup: json["blood_group"],
        locationName: json["location_name"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "address": address,
        "location": location,
        "blood_group": bloodGroup,
        "location_name": locationName,
        "user_id": userId,
      };
}
