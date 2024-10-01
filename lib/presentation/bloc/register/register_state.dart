part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Username username;
  final String email;
  final String password;
  final bool isValid;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = const Username.pure(),
      this.isValid = false,
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    String? email,
    String? password,
    bool? isValid,
  }) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
          isValid: isValid ?? this.isValid);

  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
