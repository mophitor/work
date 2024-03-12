import 'package:flutter/material.dart';

class TextFormFieldSample extends StatelessWidget {
  final String txt;
  const TextFormFieldSample({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: txt,
        //prefixIcon: const Icon(Icons.email), //vpn_key
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
