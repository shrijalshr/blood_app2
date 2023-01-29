class RequestModel {
  RequestModel({
    this.id,
    this.name,
    this.phone,
    this.hospital,
    this.address,
    this.bloodGroup,
    this.locationName,
    this.amount,
    this.fname,
    this.lname,
  });

  final int? id;
  final String? name;
  final String? phone;
  final String? hospital;
  final String? address;
  final String? bloodGroup;
  final String? locationName;
  final int? amount;
  final String? fname;
  final String? lname;

  RequestModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? hospital,
    String? address,
    String? bloodGroup,
    String? locationName,
    int? amount,
    String? fname,
    String? lname,
  }) =>
      RequestModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        hospital: hospital ?? this.hospital,
        address: address ?? this.address,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        locationName: locationName ?? this.locationName,
        amount: amount ?? this.amount,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
      );

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        hospital: json["hospital"],
        address: json["address"],
        bloodGroup: json["blood_group"],
        locationName: json["location_name"],
        amount: json["amount"],
        fname: json["fname"],
        lname: json["lname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "hospital": hospital,
        "address": address,
        "blood_group": bloodGroup,
        "location_name": locationName,
        "amount": amount,
        "fname": fname,
        "lname": lname,
      };
}
