part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String usermane;
  final String email;
  final String password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.usermane = '',
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? usermane,
    String? email,
    String? password,
  }) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          usermane: usermane ?? this.usermane,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  List<Object> get props => [];
}
