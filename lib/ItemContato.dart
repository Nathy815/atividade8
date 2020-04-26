import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contato.dart';

class ItemContato extends StatelessWidget {

  final Contato _contato;
  ItemContato(this._contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png'),),
        title: Text(_contato.nome),
        subtitle: Text(_contato.email + " - " + _contato.telefone + "\n" + _contato.endereco),
        isThreeLine: true,
      ),
    );
  }
}