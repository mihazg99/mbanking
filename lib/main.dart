import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbanking/screens/register/register.dart';
import 'package:mbanking/utility/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Localization(),
      locale: const Locale('hr', 'HR'),
      title: 'mBanking',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Register(),
    );
  }
}


