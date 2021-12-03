import 'package:mbanking/models/transaction.dart';

class Account {
  Account({
    required this.id,
    required this.iban,
    required this.amount,
    required this.currency,
    required this.transactions,
  });

  String? id;
  String? iban;
  String? amount;
  String? currency;
  List<Transaction?> transactions;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json["id"],
    iban: json["IBAN"],
    amount: json["amount"],
    currency: json["currency"],
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "IBAN": iban,
    "amount": amount,
    "currency": currency,
    "transactions": List<dynamic>.from(transactions.map((x) => x!.toJson())),
  };
}