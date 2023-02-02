class ChatListModel {
  ChatListModel({
    this.name,
    this.uId,
  });

  final String? name;
  final int? uId;

  ChatListModel copyWith({
    String? name,
    int? uId,
  }) =>
      ChatListModel(
        name: name ?? this.name,
        uId: uId ?? this.uId,
      );

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        name: json["name"],
        uId: json["u_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "u_id": uId,
      };
}
