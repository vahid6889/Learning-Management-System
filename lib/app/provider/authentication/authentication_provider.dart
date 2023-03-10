import 'package:flutter/foundation.dart';

class AuthenticationProvider with ChangeNotifier {
  String createUser(String? email, String? password) {
    print(email);
    print(password);
    notifyListeners();
    return '';
  }
}

// 6 دی 1313