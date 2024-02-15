import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { invalid, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {

  static final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');
  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    switch (displayError) {
      case EmailError.format:
        return 'Campo requerido';
      case EmailError.invalid:
        return 'No tiene formato de correo electrónico';
      default:
        return null;
    }
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailError.format;
    }

    if (!emailRegExp.hasMatch(value)) {
      return EmailError.invalid;
    }

    return null;
  }
}
