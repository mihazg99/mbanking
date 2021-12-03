import 'package:flutter/material.dart';
import 'package:mbanking/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        height: 70,
        child: Stack(
          children: [
            Positioned(left: 10, child: icon()),
            Positioned(left: 90,top: -5, child: infoDate()),
            Positioned(
              top: 15,
              right: 10,
              child: Text(
                '+' + transaction!.amount!,
                style: const TextStyle(
                  color: Color.fromRGBO(69, 191, 27, 1),
                  fontFamily: 'Lato',
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget icon() {
    return Container(
        child: const Icon(
          Icons.account_balance_wallet,
          color: Colors.black,
        ),
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(196, 196, 196, 1),
          borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
        ));
  }

  Widget infoDate() {
    var formatted = transaction!.date!;
    var date = formatted.day.toString() +
        '/' +
        formatted.month.toString() +
        '/' +
        formatted.year.toString();

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          transaction!.description!,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Lato',
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          date,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(136, 136, 136, 1),
            fontFamily: 'Lato',
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
