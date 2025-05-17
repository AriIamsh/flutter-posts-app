import 'package:flutter_test/flutter_test.dart';
import 'package:posts_app/models/feedback_form_ui_state.dart';

void main() {
  test('correct email sets emailValid to true', () {
    final state = FeedbackFormUiState();
    final email = "test@test.com";

    expect(state.emailValid, true);
    state.checkEmailValidity(email);
    expect(state.emailValid, true);
  });

  test('empty email sets emailValid to false', () {
    final state = FeedbackFormUiState();
    final email = '';

    expect(state.emailValid, true);
    state.checkEmailValidity(email);
    expect(state.emailValid, false);
  });

  test('incorrectly formatted email sets emailValid to false', () {
    final state = FeedbackFormUiState();
    final email = 'test@t';

    expect(state.emailValid, true);
    state.checkEmailValidity(email);
    expect(state.emailValid, false);
  });

  test('fieldsValid with empty name, email, message', () {
    final state = FeedbackFormUiState();
    final name = '';
    final email = '';
    final message = '';

    expect(state.nameValid, true);
    expect(state.emailValid, true);
    expect(state.messageValid, true);

    state.fieldsValid(name, email, message);
    expect(state.nameValid, false);
    expect(state.emailValid, false);
    expect(state.messageValid, false);
  });

  test('fieldsValid with empty name', () {
    final state = FeedbackFormUiState();
    final name = '';
    final email = 'test@test.com';
    final message = 'test';

    expect(state.nameValid, true);
    expect(state.emailValid, true);
    expect(state.messageValid, true);

    state.fieldsValid(name, email, message);
    expect(state.nameValid, false);
    expect(state.emailValid, true);
    expect(state.messageValid, true);
  });

}