class SingleChatListModel {
  SingleChatListModel({
    this.id,
    this.ident,
    this.senderName,
    this.receiverName,
    this.fromId,
    this.toId,
    this.message,
  });

  final int? id;
  final String? ident;
  final String? senderName;
  final String? receiverName;
  final int? fromId;
  final int? toId;
  final String? message;

  SingleChatListModel copyWith({
    int? id,
    String? ident,
    String? senderName,
    String? receiverName,
    int? fromId,
    int? toId,
    String? message,
  }) =>
      SingleChatListModel(
        id: id ?? this.id,
        ident: ident ?? this.ident,
        senderName: senderName ?? this.senderName,
        receiverName: receiverName ?? this.receiverName,
        fromId: fromId ?? this.fromId,
        toId: toId ?? this.toId,
        message: message ?? this.message,
      );

  factory SingleChatListModel.fromJson(Map<String, dynamic> json) =>
      SingleChatListModel(
        id: json["id"],
        ident: json["ident"],
        senderName: json["senderName"],
        receiverName: json["receiverName"],
        fromId: json["from_id"],
        toId: json["to_id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ident": ident,
        "senderName": senderName,
        "receiverName": receiverName,
        "from_id": fromId,
        "to_id": toId,
        "message": message,
      };
}
