import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit () {
    emit(
      state.copyWith(
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        isValid: Formz.validate([state.username, state.password])
      )
    );
    print('Cubit Submit: $state');
  }

  void usernameChanged (value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password])
    ));
  }

  void emailChanged (value) {
    emit(state.copyWith(
      email: value
    ));
  }

  void passwordChanged (value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([state.username, password])
    ));
  }
}


