import 'account.dart';

class User {
  User({
    required this.userId,
    required this.acounts,
  });

  String userId;
  List<Account> acounts;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    acounts: List<Account>.from(json["acounts"].map((x) => Account.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "acounts": List<dynamic>.from(acounts.map((x) => x.toJson())),
  };
}