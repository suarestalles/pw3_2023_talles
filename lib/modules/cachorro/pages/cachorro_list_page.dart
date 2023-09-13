import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:aprendendo_flutter/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          onPressed: () {
            clearFields();
            var alert = AlertDialog(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Novo Pet'),
                ],
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Nome:'),
                      ),
                      controller: _nomeController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Campo Obrigatório!'
                          : null,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) => _save(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Descrição:'),
                      ),
                      controller: _descricaoController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Campo Obrigatório!'
                          : null,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) => _save(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Idade:'),
                      ),
                      controller: _idadeController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) => value == null || value.isEmpty
                          ? 'Campo Obrigatório!'
                          : null,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) => _save(),
                    ),
                  ],
                ),
              ),
            );

            showDialog(
              context: context,
              builder: (context) => alert,
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: cachorros.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(cachorros[index].nome ?? '-'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição: ${cachorros[index].descricao ?? '-'}',
                  ),
                  Text(
                    'Idade: ${cachorros[index].idade}',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
