import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormCachorro extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  final TextEditingController nomeController;
  final TextEditingController descricaoController;
  final TextEditingController idadeController;
  final void Function(String)? onFieldSubmitted;

  const FormCachorro({
    super.key,
    required this.formKey,
    required this.nomeController,
    required this.descricaoController,
    required this.idadeController,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Nome:'),
              ),
              controller: nomeController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Campo Obrigatório!'
                  : null,
              keyboardType: TextInputType.text,
              onFieldSubmitted: onFieldSubmitted,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Descrição:'),
              ),
              controller: descricaoController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Campo Obrigatório!'
                  : null,
              keyboardType: TextInputType.text,
              onFieldSubmitted: onFieldSubmitted,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Idade:'),
              ),
              controller: idadeController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => value == null || value.isEmpty
                  ? 'Campo Obrigatório!'
                  : null,
              keyboardType: TextInputType.number,
              onFieldSubmitted: onFieldSubmitted,
            ),
          ],
        ),
      );
  }
}