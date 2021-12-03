import 'package:http/http.dart' as http;
import 'package:mbanking/models/user.dart';
import 'dart:convert';

class Services {
  static String url =
      "http://mportal.asseco-see.hr/builds/ISBD_public/Zadatak_1.json";

  static User userFromJson(String str) => User.fromJson(json.decode(str));

  static String userToJson(User data) => json.encode(data.toJson());

   static Future<User?> getUserData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final User data = userFromJson(response.body);
      return data;
    }
  }
}
