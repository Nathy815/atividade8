import 'package:aula8/ListaContato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contato.dart';
import 'app_database.dart';

class Formulario extends StatelessWidget {

  final campoNome = TextEditingController();
  final campoEmail = TextEditingController();
  final campoTelefone = TextEditingController();
  final campoEndereco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoNome,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  icon: Icon(Icons.account_box)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoEmail,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoTelefone,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  icon: Icon(Icons.phone)
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: campoEndereco,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Endereco',
                  icon: Icon(Icons.location_city)
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            RaisedButton(
              child: Text("Salvar",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.blue,
              highlightColor: Colors.red[300],
              onPressed: () {
                save(Contato(0, campoNome.text, campoEmail.text, campoTelefone.text, campoEndereco.text)).then((id) {
                  findAll().then((contacts) => debugPrint(contacts.toString()));
                });
              },
            ),
            FlatButton(
              child: const Text('Listar Contatos',
                style: TextStyle(color: Colors.white, fontSize: 20.0,), 
              ),
              color: Colors.blueAccent,
              highlightColor: Colors.lightBlue[400],
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListaContato()));
              },
            )
          ],
        )
      ),
    );
  }
}

