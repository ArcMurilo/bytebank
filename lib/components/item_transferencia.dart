import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia(this.transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(transferencia.valor.toString()),
        leading: const Icon(Icons.monetization_on),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}
