class UserModel {
  UserModel({
    this.fname,
    this.lname,
    this.id,
    this.username,
    this.hasDonor,
  });

  final String? fname;
  final String? lname;
  final int? id;
  final String? username;
  final bool? hasDonor;

  UserModel copyWith({
    String? fname,
    String? lname,
    int? id,
    String? username,
    bool? hasDonor,
  }) =>
      UserModel(
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        id: id ?? this.id,
        username: username ?? this.username,
        hasDonor: hasDonor ?? this.hasDonor,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fname: json["fname"],
        lname: json["lname"],
        id: json["id"],
        username: json["username"],
        hasDonor: json["has_donor"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "id": id,
        "username": username,
        "has_donor": hasDonor,
      };
}
