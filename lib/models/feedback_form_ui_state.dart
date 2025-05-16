import 'package:flutter/material.dart';

class FeedbackFormUiState extends ChangeNotifier {

  bool emailValid = true;

  bool fieldsValid(String name, String email, String message) {
    checkEmailValidity(email);

    if(name.isNotEmpty && emailValid && message.isNotEmpty ) return true;
    return false;
  }

  bool checkEmailValidity(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(email.isNotEmpty && emailRegex.hasMatch(email)) {
      setEmailValidity(true);
      return true;
    }

    if(!emailRegex.hasMatch(email) && email.isNotEmpty) {
      setEmailValidity(false);
      return false;
    }
    return false;
  }

  void setEmailValidity(bool isValid) {
    if(emailValid != isValid) {
      emailValid = isValid;
      notifyListeners();
    }
  }

}