import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:aprendendo_flutter/modules/cachorro/widgets/form_cachorro.dart';
import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:aprendendo_flutter/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class CachorroListPage extends StatefulWidget {
  const CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idadeController = TextEditingController();

  List<Cachorro> cachorros = [
    Cachorro(
      id: 1,
      nome: 'Pitu',
      descricao: 'Preto com manchas brancas',
      idade: 2,
    ),
    Cachorro(
      id: 2,
      nome: 'Carote',
      descricao: 'Branco',
      idade: 5,
    ),
    Cachorro(
      id: 3,
      nome: 'Jamel',
      descricao: 'Caramelo',
      idade: 6,
    ),
  ];

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      var cachorro = Cachorro(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        idade: int.parse(_idadeController.text),
      );
      setState(() {
        cachorros.add(cachorro);
      });
      Navigator.pop(context);
    }
  }

  void _update(Cachorro cachorro) {
    if (_formKey.currentState?.validate() ?? false) {
      var cachorroEdit = cachorros.firstWhere((element) => element == cachorro);
      cachorros.removeWhere((element) => element == cachorro);

      cachorroEdit.nome = _nomeController.text;
      cachorroEdit.descricao = _descricaoController.text;
      cachorroEdit.idade = int.parse(_idadeController.text);

      setState(() {
        cachorros.add(cachorroEdit);
      });
      Navigator.pop(context);
    }
  }

  void _delete(Cachorro cachorro) {
    setState(() {
      cachorros.removeWhere((element) => element == cachorro);
    });
  }

  void _create() {
    clearFields();
    var alert = AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Novo Pet'),
        ],
      ),
      content: FormCachorro(
        formKey: _formKey,
        nomeController: _nomeController,
        descricaoController: _descricaoController,
        idadeController: _idadeController,
        onFieldSubmitted: (_) => _save(),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void _edit(Cachorro cachorro) {
    _nomeController.text = cachorro.nome ?? '';
    _descricaoController.text = cachorro.descricao ?? '';
    _idadeController.text = cachorro.idade?.toString() ?? '';

    var alert = AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Editando Pet'),
        ],
      ),
      content: FormCachorro(
        formKey: _formKey,
        nomeController: _nomeController,
        descricaoController: _descricaoController,
        idadeController: _idadeController,
        onFieldSubmitted: (_) => _update(cachorro),
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  clearFields() {
    _nomeController.text = '';
    _descricaoController.text = '';
    _idadeController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            "Listagem de Cachorros",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _create,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: cachorros.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                title: Text(
                  cachorros[index].nome ?? '-',
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descrição: ${cachorros[index].descricao ?? '-'}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Idade: ${cachorros[index].idade}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => _edit(cachorros[index]),
                      icon: const Icon(
                        Icons.edit,
                        color: MyColors.secondaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _delete(cachorros[index]),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
