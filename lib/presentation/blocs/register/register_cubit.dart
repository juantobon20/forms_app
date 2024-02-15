import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        userName: Username.dirty(state.userName.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([
          state.userName, state.email, state.password
        ])
      )
    );
    print('Submit: $state');
  }

  void userNameChange(String value) {
    final Username username = Username.dirty(value);
    
    emit(
      state.copyWith(
        userName: username,
        isValid: Formz.validate([ username, state.email, state.password ])
      )
    );
  }

  void emailChange(String value) {
    final Email email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([ state.userName, email, state.password ])
      )
    );
  }

  void passwordChange(String value) {
    final Password password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([ state.userName, state.email, password ])
      )
    );
  }

}
