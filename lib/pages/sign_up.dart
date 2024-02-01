import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import '../providers/auth_provider.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();

  bool value = false;

  //Validation of Password
  //Must be of length 6, must have a number, special character
  //One upper case letter, and lower case letter
  bool validatePassword(String pass) {
    final length = RegExp(r'.{6,}');
    bool checkLength = length.hasMatch(pass);
    final number = RegExp(r'.*?[0-9]');
    bool checkNumber = number.hasMatch(pass);
    final specChar = RegExp(r'.*?[!@#\$&*~]');
    bool checkSpecChar = specChar.hasMatch(pass);
    final uppercase = RegExp(r'.*[A-Z]');
    bool checkUppercase = uppercase.hasMatch(pass);
    final lowercase = RegExp(r'.*[a-z]');
    bool checkLowercase = lowercase.hasMatch(pass);

    if (checkLength &&
        checkNumber &&
        checkSpecChar &&
        checkLowercase &&
        checkUppercase) {
      value = true;
      return true;
    }
    return false;
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//Sign Up page to handle new users for the application
class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = "";
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Image.asset(
                      'images/coffee.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: Color(0xff967259),
                                          size: 24.0,
                                        ),
                                        buildTextFormField(
                                            "Name", _nameController, false),
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: Color(0xff967259),
                                          size: 24.0,
                                        ),
                                        buildTextFormField("Birthday",
                                            _birthdayController, false),
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.location_city,
                                          color: Color(0xff967259),
                                          size: 24.0,
                                        ),
                                        buildTextFormField("Location",
                                            _locationController, false),
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: Color(0xff967259),
                                          size: 24.0,
                                        ),
                                        buildUserNameField("Username",
                                            _usernameController, false),
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.mail,
                                          color: Color(0xff967259),
                                          size: 24.0,
                                        ),
                                        buildEmailTextFormField(
                                            "Email", _emailController, false),
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.lock,
                                          color: Color(0xff967259),
                                          size: 24.0,
                                        ),
                                        buildPasswordField("Password",
                                            _passwordController, true),
                                      ]),
                                ]))),
                    buildSignUpButton(),
                    if (error == true)
                      Text(
                        errorMessage,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ],
                ))));
  }

  //Build Text Field
  Widget buildTextFormField(
      String label, TextEditingController controller, bool obscure) {
    return Container(
      width: 300,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onSaved: (String? initialValue) {
          _formKey.currentState?.save();
        },
        validator: (String? value) => value!.isEmpty ? 'Cannot be blank' : null,
      ),
    );
  }

  //Build Email Field for getting the User Email
  Widget buildEmailTextFormField(
      String label, TextEditingController controller, bool obscure) {
    return Container(
      width: 300,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onSaved: (String? initialValue) {
          _formKey.currentState?.save();
        },
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Cannot be Blank';
          } else if (!EmailValidator.validate(_emailController.text)) {
            return 'Enter Valid Email Address';
          } else {
            return null;
          }
        },
      ),
    );
  }

  //Build User Name Field for getting the User name
  Widget buildUserNameField(
      String label, TextEditingController controller, bool obscure) {
    return Container(
      width: 300,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onSaved: (String? initialValue) {
          _formKey.currentState?.save();
        },
        validator: (String? value) => value!.isEmpty ? 'Cannot be blank' : null,
      ),
    );
  }

  //Build Password Field
  Widget buildPasswordField(
      String label, TextEditingController controller, bool obscure) {
    return Container(
      width: 300,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onSaved: (String? initialValue) {
          _formKey.currentState?.save();
        },
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Cannot be Blank';
          } else if (!widget.validatePassword(_passwordController.text)) {
            return 'Enter Valid Password';
          } else {
            return null;
          }
        },
      ),
    );
  }

  //Build Sign Up Button
  Widget buildSignUpButton() {
    return Container(
        height: 50,
        width: 250,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ElevatedButton(
          child: const Text('Sign Up'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              int status = await context.read<AuthProvider>().signUp(
                  _emailController.text,
                  _passwordController.text,
                  _nameController.text,
                  _birthdayController.text,
                  _locationController.text,
                  _usernameController.text);

              if (status != 0) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email Already Used!')));
              }
            }
          },
        ));
  }
}
