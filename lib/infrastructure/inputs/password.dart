


import 'package:formz/formz.dart';

enum PasswordError { length, empty }

class Password extends FormzInput <String, PasswordError> {

  const Password.pure() : super.pure('');

  const Password.dirty(super.value) : super.dirty();

  @override
  PasswordError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if( value.length < 6 || value.trim().length < 6 ) return PasswordError.length;

    return null;
  }

}