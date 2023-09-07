import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:flutter/material.dart';

class CachorroListPage extends StatefulWidget {
  CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
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

  List<Widget> _buildCachorros() {
    List<Widget> widgets = [];
    cachorros.forEach((element) {
      widgets.add(ListTile(
        title: Text(element.nome ?? '-'),
        subtitle: Text(element.descricao ?? '-'),
      ));
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Listagem de Cachorros",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var cachorro = Cachorro(
              nome: 'Catuaba',
              descricao: 'Preto',
              idade: 10,
            );
    
            setState(() {
              cachorros.add(cachorro);
            });
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: cachorros.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(cachorros[index].nome ?? '-'),
              subtitle: Text(cachorros[index].descricao ?? '-'),
            );
          },
        ),
      ),
    );
  }
}
