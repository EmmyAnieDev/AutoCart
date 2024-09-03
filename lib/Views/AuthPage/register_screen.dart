import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../Riverpod/auth_riverpod.dart';
import 'Widgets/auth_button.dart';
import 'Widgets/custom_text_field.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

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
                  SizedBox(height: MediaQuery.of(context).size.height / 95),
                  const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                  const Text('Please enter your registration details'),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'First Name',
                    controller: authProviderInstance.firstNameController,
                    validator: authProviderInstance.validateFirstName,
                    showEyeToggle: false, // No eye toggle for RegisterScreen
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Last Name',
                    controller: authProviderInstance.lastNameController,
                    validator: authProviderInstance.validateLastName,
                    showEyeToggle: false, // No eye toggle for RegisterScreen
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Email',
                    controller: authProviderInstance.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: authProviderInstance.validateEmail,
                    showEyeToggle: false, // No eye toggle for RegisterScreen
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Password',
                    controller: authProviderInstance.passwordController,
                    obscureText: true,
                    validator: authProviderInstance.validatePassword,
                    showEyeToggle: false, // No eye toggle for RegisterScreen
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Confirm Password',
                    controller: authProviderInstance.confirmPasswordController,
                    obscureText: true,
                    validator: authProviderInstance.validateConfirmPassword,
                    showEyeToggle: false, // No eye toggle for RegisterScreen
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    label: 'Sign Up',
                    onPress: () =>
                        authProviderInstance.submitRegisterForm(formKey),
                  ),
                  const Center(child: Text('Or sign up with')),
                  const SizedBox(height: 25),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/google.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () => context.go('/login'),
                        child: const Text('Sign in'),
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
