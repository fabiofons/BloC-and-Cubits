import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit () {
    print('Cubit Submit: $state');
  }

  void usernameChanged (value) {
    print('value $value');
    print('value $state');
    emit(state.copyWith(
      username: value
    ));
  }
  void emailChanged (value) {
    emit(state.copyWith(
      email: value
    ));
  }
  void passwordChanged (value) {
    emit(state.copyWith(
      password: value
    ));
  }
}


