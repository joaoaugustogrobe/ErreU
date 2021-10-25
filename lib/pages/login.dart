// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

enum ErrorCode { error_wrong_email_or_password, error_invalid_email }

class _LoginState extends State<Login> {
  late String _email, _password;
  ErrorCode? errorCode;
  GlobalKey<FormState> formEmailKey = new GlobalKey();
  final formPasswordKey = GlobalKey<FormState>();

  bool formValidateAndSave() {
    return formEmailValidateAndSave() && formPasswordValidateAndSave();
  }

  void formValidateAndSubmit() async {
    print('validate');
    errorCode = null;
    try {
      if (formValidateAndSave()) {
        print('Signed in!');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Logged successfully!"),
        ));
      }
      // ignore: nullable_type_in_catch_clause
    } on PlatformException catch (e) {
      if (e.code == "ERROR_WRONG_PASSWORD" ||
          e.code == "ERROR_USER_NOT_FOUND") {
        errorCode = ErrorCode.error_wrong_email_or_password;
      }
      formEmailKey.currentState!.validate();
      if (e.code == "ERROR_INVALID_EMAIL") {
        errorCode = ErrorCode.error_invalid_email;
      }
      formEmailKey.currentState!.validate();
    }
  }

  bool formEmailValidateAndSave() {
    final form = formEmailKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void formEmailResetValidation() {
    final form = formEmailKey.currentState;
    form!.reset();
  }

  bool formPasswordValidateAndSave() {
    final form = formPasswordKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formEmailKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  enableSuggestions: false,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = RegExp(pattern);
                    return regex.hasMatch(value!)
                        ? null
                        : 'Enter a valid email';
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formPasswordKey,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Password must have at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [Color(0xFFF58524), Color(0xFFF92B7F)]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35)
                        //Radius.circular(5)
                        )),
                child: SizedBox.expand(
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          child:
                              const Icon(Icons.food_bank, color: Colors.white),
                        )
                      ],
                    ),
                    onPressed: () {
                      formValidateAndSubmit();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("You don't have any account ?"),
                      Spacer(),
                      Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange),
                      )
                    ],
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     // builder: (context) => SignUpPage(auth: widget.auth, database: widget.database, storage: widget.storage,),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
