import 'package:aula8/app_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contato.dart';
import 'ItemContato.dart';

class ListaContato extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: FutureBuilder (
        future: findAll(),
        builder: (context, snapshot) {
          final List<Contato> contacts = snapshot.data;

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final Contato contato = contacts[index];
              return ItemContato(contato);
            }
          );
        },
      )
    );
  }
}