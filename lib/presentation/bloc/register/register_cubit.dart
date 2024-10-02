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
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password, state.email])
      )
    );
    print('Cubit Submit: $state');
  }

  void usernameChanged (value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.email, state.password])
    ));
  }

  void emailChanged (value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([ email, state.username, state.password])
    ));
  }

  void passwordChanged (value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email])
    ));
  }
}


