import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'hr_HR': {
      'logout': 'Odjava',
      'accounts':'Računi',
      'login':'Prijava',
      'register':'Registracija',
      'next':'Dalje',
      'firstname':'IME',
      'lastname':'PREZIME',
      'hi':'Bok,'
    },
    'en_US':{
      'logout': 'Logout',
      'accounts':'Accounts',
      'login':'Login',
      'register':'Registration',
      'next':'Next',
      'firstname':'FIRSTNAME',
      'lastname':'LASTNAME',
      'hi':'Hi,'

    }
  };
}