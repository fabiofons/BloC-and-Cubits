part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Username username;
  final String email;
  final Password password;
  final bool isValid;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = const Username.pure(),
      this.isValid = false,
      this.email = '',
      this.password = const Password.pure()});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    String? email,
    Password? password,
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
