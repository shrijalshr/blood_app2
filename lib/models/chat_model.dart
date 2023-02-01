// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatListModel {
  String? name;
  String? uid;
  ChatListModel({
    this.name,
    this.uid,
  });

  ChatListModel copyWith({
    String? name,
    String? uid,
  }) {
    return ChatListModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
    };
  }

  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      name: map['name'] != null ? map['name'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListModel.fromJson(String source) =>
      ChatListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatListModel(name: $name, uid: $uid)';

  @override
  bool operator ==(covariant ChatListModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.uid == uid;
  }

  @override
  int get hashCode => name.hashCode ^ uid.hashCode;
}
