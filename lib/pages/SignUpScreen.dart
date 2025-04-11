import 'package:flutter/material.dart';
import 'package:hive_crud/pages/LoginScreen.dart';
import 'package:hive_crud/widget/gradient_button.dart';
import 'package:hive_crud/widget/login_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Image.asset('assets/images/signin_balls.png'),
                const Text(
                  'Sign in.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                const SizedBox(height: 50),
                // const SocialButton(
                //   iconPath: 'assets/svgs/g_logo.svg',
                //   label: 'Continue with Google',
                // ),
                // const SizedBox(height: 20),
                // const SocialButton(
                //   iconPath: 'assets/svgs/f_logo.svg',
                //   label: 'Continue with Facebook',
                //   horizontalPadding: 90,
                // ),
                const SizedBox(height: 15),
                const Text('or', style: TextStyle(fontSize: 17)),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'First Name',
                  controller: firstNameController,
                  icon: Icons.abc,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                  icon: Icons.abc,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Email',
                  controller: emailController,
                  icon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  icon: Icons.lock_outline_rounded,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Please enter some text';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                GradientButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const SizedBox(height: 20),
                GradientButton(
                  text: 'Back',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
