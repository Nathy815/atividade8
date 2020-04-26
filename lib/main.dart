import 'package:flutter/material.dart';
import 'Formulario.dart';

void main() => runApp(Cadastro());

class Cadastro extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Formulario(),
    );
  }
}