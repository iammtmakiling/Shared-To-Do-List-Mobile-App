import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//Log In page handles the signing in of the user
//It checks if both email and password is present in the firebase
class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Image.asset(
                      'images/coffee.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.mail,
                                    color: Color(0xff967259),
                                    size: 24.0,
                                  ),
                                  buildTextFormField(
                                      "Email", emailController, false),
                                ]),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.lock,
                                    color: Color(0xff967259),
                                    size: 24.0,
                                  ),
                                  buildTextFormField(
                                      "Password", passwordController, true),
                                ]),
                          ],
                        )),
                    buildLogInButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            // Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ))));
  }

  //Build Text Form Field
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

  //Build Log In Button
  Widget buildLogInButton() {
    return Container(
        height: 50,
        width: 250,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              String mes = await context
                  .read<AuthProvider>()
                  .signIn(emailController.text, passwordController.text);

              if (mes != "") {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(mes)));
              }
              // emailController.clear();
              // passwordController.clear();
            }
          },
        ));
  }
}
