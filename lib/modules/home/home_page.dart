import 'dart:developer';

import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                'TITULO HOME PAGE',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Text('Segundo Texto'),
          TextField(
            onChanged: (value) => log(value),
            onSubmitted: (value) => log('Enviado => $value'),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CentavosInputFormatter(),
            ],
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.SEGUNDA_PAGINA),
            child: const Text('Proxima Tela'),
          ),
        ],
      ),
    );
  }
}
