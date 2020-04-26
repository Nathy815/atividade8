import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'contato.dart';


  Future<Database> createDatabase() {
    return getDatabasesPath().then((dbPath) {
      final String path = join(dbPath, 'cadastro.db');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE contatos ('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'email TEXT, '
          'telefone TEXT, '
          'endereco TEXT)'
        );
      }, version: 2);
    });
  }

  Future<int> save(Contato contact) {
    return createDatabase().then((db) {
      final Map<String, dynamic> contactMap = Map();

      contactMap['name'] = contact.nome;
      contactMap['email'] = contact.email;
      contactMap['telefone'] = contact.telefone;
      contactMap['endereco'] = contact.endereco;
      return db.insert('contatos', contactMap);
    });
  }

  Future<List<Contato>> findAll() {
    return createDatabase().then((db) {
      return db.query('contatos').then((maps) {
        final List<Contato> contacts = List();
        for (Map<String, dynamic> map in maps) {
          final Contato contact = Contato(
            map['id'],
            map['name'],
            map['email'],
            map['telefone'],
            map['endereco']
          );
          contacts.add(contact);
        }
        return contacts;
      });
    });
  }