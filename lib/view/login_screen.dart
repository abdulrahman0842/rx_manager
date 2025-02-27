import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rx_manager/utils/utils.dart';
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
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  Future<void> login() async {
    log("message");
    try {
      await AuthService().loginWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      if (context.mounted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        Utils.flushBarSuccessMessage('Welcome back!', context);
      }
    } catch (e) {
      if (context.mounted) {
        Utils.showFlushBarErrorMessage(e.toString(), context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    /*
    WidgetsBinding.instance.addPostFrameCallback is often used to perform actions after the widget tree has been built and the UI is rendered.
    
    When you register a callback using addPostFrameCallback, Flutter queues it to be executed after the current frame is drawn, meaning it happens once the UI update is complete.
    */
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailNode.requestFocus();
    });
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                currentNode: emailNode,
                nextNode: passwordNode,
              ),
              CustomTextFormField(
                controller: _passwordController,
                hintText: 'Enter Password',
                isObscure: true,
                currentNode: passwordNode,
                nextNode: null,
                onSubmitted: login,
              ),
              ElevatedButton(
                  onPressed: () {
                    login();
                    log('Login');
                  },
                  child: Text('Login')),
            ],
          ),
        ),
      ),
    ));
  }
}
