import 'package:flutter/material.dart';

//Text Field for getting information is defined here
class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField({
    Key? key,
    required this.label,
    required TextEditingController controller,
    required this.obscure,
  })  : _controller = controller,
        super(key: key);

  final String label;
  final TextEditingController _controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        obscureText: obscure,
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onSaved: (String? initialValue) {},
        validator: (String? value) => value!.isEmpty ? 'Cannot be blank' : null,
      ),
    );
  }
}
