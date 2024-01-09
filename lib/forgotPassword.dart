import 'dart:convert';

import 'package:adv_basics/custom_widget/app_buttons.dart';
import 'package:adv_basics/custom_widget/app_textfield.dart';
import 'package:adv_basics/custom_widget/app_titlebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final String _email = '';

  void _forgotPassword() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final queryParameters = {
        'firm_id': '2',
      };
      final url = Uri.https('test.owlinvest.com',
          '/api/v1/admin_users/forgot_password', queryParameters);

      final response = http.post(url,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: json.encode({
            "client_id":
                "2461154190769aa4e333ed5817e90ca4e0bd414288329fe12c8f242162aa8ac7",
            "client_secret":
                "faba6f4e568f0c6532c4ab799c1d8e2654840b3c1cb788687de9529730321eef",
            "email": _email,
            "firm_id": "2"
          }));

      print(response);
    }
  }

  @override
  Widget build(context) {
    return CupertinoPageScaffold(
    //  backgroundColor: const Color.fromARGB(255, 232, 227, 227),
      navigationBar: appTitleBar(
          context,
          const Icon(
            Icons.arrow_back_ios,
            size: 22.0,
            color: CupertinoColors.white,
          ),
          'Forgot Password'),
      //  CupertinoNavigationBar(
      //   leading: CupertinoButton(
      //       child: const Icon(Icons.arrow_back_ios),
      //       onPressed: () {
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(builder: (context) => const Login()),
      //         );
      //       }),
      //   middle: const Text('Forgot Password'),
      // ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/1024.png', width: 300),
             

              CupertinoFormSection(
              //  backgroundColor: const Color.fromARGB(255, 232, 227, 227),
                //decoration: 5,
                children: [
                  AppTextField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty
                          ? 'Enter Username'
                          : null);
                    },
                    controller: _emailController,
                    label: 'Email',
                    prefix: const Icon(Icons.email),
                    placeholder: 'Email',
                  ),

                  // CupertinoTextFormFieldRow(
                  //   prefix: const Icon(Icons.email),
                  //   placeholder: 'Email',
                  //   onSaved: (value) {
                  //     _email = value;
                  //   },
                  //   validator: (String? value) {
                  //     return (value == null || value.isEmpty ? 'Enter Email' : null);
                  //   },
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: AppButtons(
                  textColor: Colors.white,
                  backgroundColor: Colors.blue,
                  borderColor: Colors.blue,
                  text: 'Submit',
                  size: 50.0,
                  onPressed: () => {_forgotPassword()},
                ),

                // CupertinoButton.filled(onPressed: _loginSubmit, child: const Text('Login')),
              ),

              //  AppButtons(
              //   textColor: Colors.white,
              //   backgroundColor: Colors.blue,
              //   borderColor: Colors.blue,
              //   text: 'Submit',
              //   size: 50.0,
              //   onPressed: () => {_forgotPassword()},
              // ),
              // )
              //CupertinoButton.filled(onPressed: _forgotPassword, child: const Text('Reset Password')),
              //  )
            ],
          ),
        ),
      ),
    );
  }
}
