import 'dart:convert';
import 'package:adv_basics/auth.dart';
import 'package:adv_basics/custom_widget/app_buttons.dart';
import 'package:adv_basics/custom_widget/app_textfield.dart';
import 'package:adv_basics/custom_widget/app_titlebar.dart';
import 'package:adv_basics/dashboard.dart';
import 'package:adv_basics/forgotPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

  final String _email = '';

  @override
  void initState() {
    super.initState();
    //checkLoginStatus();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  bool shouldFullyObstruct(BuildContext context) {
    // TODO: implement shouldFullyObstruct
    throw UnimplementedError();
  }

  checkLoginStatus() async {
    var isLogin = await SessionManager().get("isLogin");
    if (isLogin ?? true) {
      _authenticateBiometric();
    }
  }

  void _loginSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final queryParameters = {
        'firm_id': '2',
      };
      final url = Uri.https('test.owlinvest.com',
          '/api/v1/admin_users/forgot_password', queryParameters);

      final response = await http.post(url,
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
    }
  }

  void _authenticateBiometric() async {
    bool isAuthenticated = await AuthService.authenticateUser();
    if (isAuthenticated) {
      //await SessionManager().set("isLogin", true);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Authentication failed.'),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    String? password = '';
    return CupertinoPageScaffold(
      navigationBar: appTitleBar(
          context, '', dotenv.env['ENVIRONMENT'] ?? 'API_URL not found'),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Image.asset('financial.png', width: 400),
              const SizedBox(
                height: 40,
              ),
              CupertinoFormSection.insetGrouped(children: [
                AppTextField(
                  validator: (String? value) {
                    return (value == null || value.isEmpty
                        ? 'Enter Username'
                        : null);
                  },
                  controller: _usernameController,
                  label: 'username',
                  prefix: const Icon(Icons.person),
                  placeholder: 'Username',
                ),
                AppTextField(
                  validator: (String? value) {
                    return (value == null || value.isEmpty
                        ? 'Enter Password'
                        : null);
                  },
                  controller: _usernameController,
                  obsecure: true,
                  label: 'Password',
                  prefix: const Icon(Icons.lock),
                  placeholder: 'Password',
                ),
              ]),
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
                  text: 'Login',
                  size: 50.0,
                  onPressed: _loginSubmit,
                ),

                // CupertinoButton.filled(onPressed: _loginSubmit, child: const Text('Login')),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CupertinoButton(
                      alignment: Alignment.bottomLeft,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15),
                          selectionColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      alignment: Alignment.bottomRight,
                      onPressed: () {
                        _authenticateBiometric();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Text(
                          'Login with FaceID',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 15),
                          selectionColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
