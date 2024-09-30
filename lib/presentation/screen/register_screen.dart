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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormField(label: 'Username',),
          const SizedBox(height: 10,),
          const CustomTextFormField(label: 'Email',),
          const SizedBox(height: 10),
          const CustomTextFormField(label: 'Password', obscureText: true,),
          const SizedBox(height: 10),

          FilledButton.tonalIcon(
            onPressed: () {},
            label: const Text('Create user'),
            icon: const Icon(Icons.save_outlined),
          )
        ],
    ));
  }
}
