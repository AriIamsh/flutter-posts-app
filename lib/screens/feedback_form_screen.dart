import 'package:flutter/material.dart';

class FeedbackForm extends StatelessWidget {

  bool snackBarVisible = true;

  void showSnackBar() {
    //todo
  }
  //todo: textField bg ; button size ; card size
  //todo: fix SnackBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Feedback Form'),),
      body: form(),
    );
  }

  Widget form() {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            formField('Name'),
            formField('Email'),
            formField('Message', multilined: true),
            TextButton(
              onPressed: showSnackBar,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey),
              ),
              child: Text(
                'Send',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget formField(String title, {bool multilined = false }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 0,
        children: [
          Text(title),
          TextField (
              maxLines: multilined ? null : 1
          )
        ],
      ),
    );
  }

  Widget snackBar() {
    return Center(
        child: SnackBar(
            content: Center(
              child: Text("Thank you for your feedback!"),
            )
        )
    );
  }

}