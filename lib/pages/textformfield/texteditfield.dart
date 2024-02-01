import 'package:flutter/material.dart';

//Text Field for editing is defined here
class BuildEditTextFormField extends StatelessWidget {
  const BuildEditTextFormField({
    Key? key,
    required TextEditingController controller,
    required this.hint,
    required this.obscure,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final bool obscure;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: obscure,
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
        onSaved: (String? initialValue) {},
        validator: (String? value) => value!.isEmpty ? 'Cannot be blank' : null,
      ),
    );
  }
}
