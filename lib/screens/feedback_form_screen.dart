import 'package:flutter/material.dart';

//todo: fix overflow keyboard issue
//todo: validate email and display warning
class FeedbackForm extends StatelessWidget {

  String _name = "";
  String _email = "";
  String _message = "";

  void showSnackBar( BuildContext context ) {
    if(_name.isEmpty || _email.isEmpty || _message.isEmpty) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you for your feedback!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  bool emailIsValid() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(_email.isNotEmpty && emailRegex.hasMatch(_email)) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Feedback Form'),),
      resizeToAvoidBottomInset: false,
      body: form(context),
    );
  }

  Widget form(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            formField('Name', (value) => _name = value ),
            formField('Email', (value) => _email = value),
            formField('Message', (value) => _message = value, multilined: true),
            sendButton(context)
          ],
        ),
      ),
    );
  }

  Widget formField(
      String title,
      void Function(String) onTextChanged,
      { bool multilined = false }
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(title, style: TextStyle(fontSize: 16),),
          TextField (
            onChanged: (value) => onTextChanged(value),
            maxLines: multilined ? null : 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
              )),
          )
        ],
      ),
    );
  }

  Widget sendButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showSnackBar(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size(200, 20),
        elevation: 1
      ),
      child: Text(
        'Send',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),
      ),
    );
  }

}