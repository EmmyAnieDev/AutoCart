import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../Riverpod/auth_riverpod.dart';
import 'Widgets/auth_button.dart';
import 'Widgets/custom_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviderInstance = ref.watch(authProvider);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 9),
                  const Text(
                    'Sign in',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                  const Text('Please enter your login credentials'),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: 'Email',
                    controller: authProviderInstance.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: authProviderInstance.validateEmail,
                    showEyeToggle: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Password',
                    controller: authProviderInstance.passwordController,
                    obscureText: true,
                    validator: authProviderInstance.validatePassword,
                    showEyeToggle: true,
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot password?'),
                  ),
                  AuthButton(
                    label: 'Sign In',
                    onPress: () =>
                        authProviderInstance.submitLoginForm(formKey),
                  ),
                  const Center(child: Text('Or sign in with')),
                  const SizedBox(height: 30),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/google.png'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () => context.go('/register'),
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
