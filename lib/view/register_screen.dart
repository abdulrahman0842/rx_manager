import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rx_manager/components/custom_text_form_field.dart';
import 'package:rx_manager/services/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            CustomTextFormField(
              controller: _emailController,
              hintText: 'Enter Email',
            ),
            CustomTextFormField(
              controller: _passwordController,
              hintText: 'Enter Password',
            ),
            GestureDetector(
                onTap: () {
                  try {
                    AuthService().registerWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Text('Register'))
          ],
        ),
      ),
    ));
  }
}
