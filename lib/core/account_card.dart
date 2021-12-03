import 'package:flutter/material.dart';
import 'package:mbanking/models/account.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key, required this.acc, required this.call}) : super(key: key);

  final Account acc;
  final VoidCallback call;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: call,
      child: Center(
        child: Container(
          height: 154,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          child: Stack(
            children:  [
               Positioned(
                  top: 29,
                  left: 22,
                  child:  Text(
                    acc.iban!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
              Positioned(
                  top: 114,
                  left: 22,
                  child: Text(
                    acc.amount!+' '+acc.currency!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )),
              Positioned(
                  top: 67,
                  right: 20,
                  child: Container(child: const Center(child: Icon(Icons.arrow_forward),),
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(34, 34)),
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
