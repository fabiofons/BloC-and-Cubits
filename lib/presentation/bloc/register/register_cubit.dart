import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit () {
    print('Submit: $state');
  }

  void usermaneChanged (value) {
    emit(state.copyWith(
      usermane: value
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


