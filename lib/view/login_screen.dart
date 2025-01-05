import 'package:flutter/material.dart';
import 'package:rx_manager/utils/utils.dart';
import 'package:rx_manager/widgets/custom_button.dart';
import 'package:rx_manager/widgets/custom_text_form_field.dart';
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
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(),
            color: Colors.teal.shade200),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpg'),
                          fit: BoxFit.cover))),
              Text('Welcome back',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              CustomTextFormField(
                controller: _emailController,
                hintText: 'Enter Email',
              ),
              CustomTextFormField(
                controller: _passwordController,
                hintText: 'Enter Password',
                isObscure: true,
              ),
              CustomButton(
                label: 'Login',
                onTap: () async {
                  try {
                    await AuthService().loginWithEmailAndPassword(
                        _emailController.text, _passwordController.text);

                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                      Utils.flushBarSuccessMessage('Welcome back!', context);
                    }
                  } catch (e) {
                    if (context.mounted) {
                      Utils.showFlushBarErrorMessage(e.toString(), context);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
