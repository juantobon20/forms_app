import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const _RegisterView(),
      )
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              FlutterLogo(size: 100,),
              
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
    final registerCubit = context.watch<RegisterCubit>();
    final state = registerCubit.state;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            errorMessage: state.userName.errorMessage,
            onChanged: registerCubit.userNameChange,
          ),

          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: registerCubit.emailChange,
            errorMessage: state.email.errorMessage
          ),

          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: registerCubit.passwordChange,
            errorMessage: state.password.errorMessage
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: registerCubit.onSubmit, 
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),

          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}