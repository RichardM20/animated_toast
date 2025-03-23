import 'package:example/src/views/widgets/buttons/loading_button.dart';
import 'package:example/src/views/widgets/inputs/generic_input.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String message = 'Debe ingresar datos válidos\nNo sea imbecil!!!';
  bool _isLoading = false;

  void _onLoginPressed(context) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 14,
            children: [
              CardForm(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              SizedBox(height: 8),
              Center(
                child: LoadingButton(
                  buttonText: 'Login',
                  isLoading: _isLoading,
                  onPressed: () => _onLoginPressed(context),
                ),
              ),
              CustomRichText(
                text: 'Don\'t have an account? ',
                linkText: 'Sign up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const CardForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 100,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: LoginForm(
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        GenericInput.email(label: 'Email', controller: emailController),
        GenericInput.password(
          label: 'Password',
          controller: passwordController,
        ),
        SizedBox(height: 12),
        CustomRichText(text: 'Forgot your password? ', linkText: 'Reset it'),
      ],
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String text;
  final String linkText;

  const CustomRichText({super.key, required this.text, required this.linkText});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.grey, fontSize: 12),
        children: <TextSpan>[
          TextSpan(
            text: linkText,
            style: TextStyle(
              color: Colors.deepPurple,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
