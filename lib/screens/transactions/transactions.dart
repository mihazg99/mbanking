import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbanking/core/account_card.dart';
import 'package:mbanking/models/account.dart';
import 'package:mbanking/models/transaction.dart';
import 'package:mbanking/screens/home/home.dart';
import 'package:mbanking/screens/transactions/widgets/transaction_card.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key, required this.acc}) : super(key: key);

  final Account acc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: InkWell(
                onTap: () => Get.to(() => Home()),
                child: const Icon(Icons.arrow_back)),
          ),
          const SizedBox(
            height: 20,
          ),
          AccountCard(acc: acc, call: () {}),
          const SizedBox(height: 20),
          Expanded(child: buildList(context))
        ],
      ),
    );
  }

  Widget buildList(context) {
    List<Transaction?> transactions = acc.transactions;
    transactions.sort((b,a) => a!.date!.compareTo(b!.date!));

    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(transaction: transactions[index]);
        });
  }
}
