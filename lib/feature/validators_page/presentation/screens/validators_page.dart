import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class ValidatorsPage extends StatelessWidget {
  const ValidatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Validators'),
      ),
      body: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              if (val == null || val.toString().isEmpty) {
                return 'Email empty';
              }
              if (!isEmail(val.trim())) {
                return 'Email invalid';
              }
              return null;
            },
          ),
          Text('Validators'),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) {
              if (val == null || val.toString().isEmpty) {
                return 'Email empty';
              }
              if (!val.isEmail()) {
                return 'Email invalid';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

extension StringExt on String {
  bool isEmail() {
    return RegExp(r"^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$").hasMatch(this);
  }
}
