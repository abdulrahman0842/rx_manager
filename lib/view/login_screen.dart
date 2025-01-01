import 'package:flutter/material.dart';
import 'package:rx_manager/components/custom_text_form_field.dart';
import 'package:rx_manager/services/auth/auth_service.dart';
import 'package:rx_manager/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                onTap: () async {
                  try {
                    await AuthService().loginWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(e.toString()),
                          );
                        });
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    ));
  }
}
