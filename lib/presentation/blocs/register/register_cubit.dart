import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit: $state');
  }

  void userNameChange(String value) {
    emit(
      state.copyWith(
        userName: value
      )
    );
  }

  void emailChange(String value) {
    emit(
      state.copyWith(
        email: value
      )
    );
  }

  void passwordChange(String value) {
    emit(
      state.copyWith(
        password: value
      )
    );
  }
}
