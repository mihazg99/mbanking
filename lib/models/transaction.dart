import 'package:intl/intl.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.date,
    required this.description,
    required this.amount,
    required this.type,
  });

  String? id;
  DateTime? date;
  String? description;
  String? amount;
  String? type;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    DateFormat inputFormat = DateFormat('d.M.y');

    return Transaction(
      id: json["id"],
      date: inputFormat.parse(json["date"]),
      description: json["description"],
      amount: json["amount"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "description": description,
    "amount": amount,
    "type": type,
  };
}