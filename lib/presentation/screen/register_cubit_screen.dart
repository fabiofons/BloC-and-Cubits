import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/bloc/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterCubitScreen extends StatelessWidget {
  const RegisterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New User Cubit'),
        ),
        body: BlocProvider(
          create: ( _ ) => RegisterCubit(), 
          child: const _RegisterFormView()
        )
    );
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

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
           CustomTextFormField(
            label: 'Username',
            onChanged: ( value ){
              registerCubit.usernameChanged(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if( value == null || value.isEmpty || value.trim().isEmpty ) return 'Required field';
              if( value.length < 4 ) return 'Must be greater than 4 character';

              return null;
            },
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Email',
            onChanged: ( value ){
              registerCubit.emailChanged(value);
              _formKey.currentState!.validate();
            },
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
            onChanged: ( value ){
              registerCubit.passwordChanged(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if( value == null || value.isEmpty || value.trim().isEmpty ) return 'Required field';
              return null;
            },
          ),
          const SizedBox(height: 10),

          FilledButton.tonalIcon(
            onPressed: () {
              // final isValidForm = _formKey.currentState!.validate();
              // if( !isValidForm ) return;

              registerCubit.onSubmit();
            },
            label: const Text('Create user'),
            icon: const Icon(Icons.save_outlined),
          )
        ],
    ));
  }
}
