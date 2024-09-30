import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New User'),
        ),
        body: const _RegisterFormView());
  }
}

class _RegisterFormView extends StatelessWidget {
  const _RegisterFormView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(height: 10),
              _RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final _formKey = GlobalKey<FormState>();
  String usermane = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
           CustomTextFormField(
            label: 'Username',
            onChanged: (value) => usermane = value,
            validator: (value) {
              if( value == null || value.isEmpty || value.trim().isEmpty ) return 'Required field';
              if( value.length < 4 ) return 'Must be greater than 4 character';

              return null;
            },
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            validator: (value) {
              if( value == null || value.isEmpty || value.trim().isEmpty ) return 'Required field';

              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if( !emailRegExp.hasMatch(value)) return 'Invalid email';
              return null;
            },
          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Password', 
            obscureText: true,
            onChanged: (value) => password = value,
          ),
          const SizedBox(height: 10),

          FilledButton.tonalIcon(
            onPressed: () {
              final isValidForm = _formKey.currentState?.validate();
              if( isValidForm! ) return print('$usermane, $email, $password');
            },
            label: const Text('Create user'),
            icon: const Icon(Icons.save_outlined),
          )
        ],
    ));
  }
}
