import 'package:flutter/material.dart';

class FeedbackFormUiState extends ChangeNotifier {

  bool emailValid = true;
  bool nameValid = true;
  bool messageValid = true;

  bool fieldsValid(String name, String email, String message) {
    setNameValidity(name.isNotEmpty);
    setMessageValidity(message.isNotEmpty);
    checkEmailValidity(email);

    return (nameValid && emailValid && messageValid) ? true : false;
  }

  void checkEmailValidity(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(email.isNotEmpty && emailRegex.hasMatch(email)) {
      setEmailValidity(true);
    }

    if(!emailRegex.hasMatch(email) || email.isEmpty) {
      setEmailValidity(false);
    }
  }

  void setNameValidity(bool value) {
    if(nameValid != value) {
      nameValid = value;
      notifyListeners();
    }
  }

  void setMessageValidity(bool value) {
    if(messageValid != value) {
      messageValid = value;
      notifyListeners();
    }
  }

  void setEmailValidity(bool value) {
    if(emailValid != value) {
      emailValid = value;
      notifyListeners();
    }
  }

}