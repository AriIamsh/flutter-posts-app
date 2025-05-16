import 'package:flutter/material.dart';
import 'package:posts_app/models/feedback_form_ui_state.dart';
import 'package:provider/provider.dart';

//todo: fix overflow keyboard issue
class FeedbackFormScreen extends StatefulWidget {

  const FeedbackFormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackFormScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();


  void showSnackBar( BuildContext context ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you for your feedback!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FeedbackFormUiState>(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Feedback Form'),),
      resizeToAvoidBottomInset: false,
      body: form(context, state),
    );
  }

  Widget form(BuildContext context, FeedbackFormUiState state) {

    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            formField('Name', nameController),
            emailField('Email', emailController, state),
            formField('Message', messageController, multilined: true),
            sendButton(context, state)
          ],
        ),
      ),
    );
  }

  Widget formField(
      String title,
      TextEditingController controller,
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
            controller: controller,
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

  Widget emailField(
      String title,
      TextEditingController controller,
      FeedbackFormUiState state,
      ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(title, style: TextStyle(fontSize: 16),),
          TextField (
            controller: controller,
            onChanged: (_) => state.setEmailValidity(true),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                )),
          ),
          state.emailValid ? SizedBox.shrink() : Text("Email is invalid", style: TextStyle(color: Colors.red))
        ],
      ),
    );
  }

  Widget sendButton(
      BuildContext context,
      FeedbackFormUiState state,
      ) {
    return ElevatedButton(
      onPressed: () {
        if(state.fieldsValid(nameController.text, emailController.text, messageController.text)) {
          nameController.clear();
          emailController.clear();
          messageController.clear();
          showSnackBar(context);
        }
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