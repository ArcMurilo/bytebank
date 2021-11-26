import 'package:bytebank/components/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

class ListaTransferencia extends StatefulWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  final List<Transferencia> _transferencias = [
    Transferencia('10001-0', 100),
    Transferencia('20002-0', 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, indice) {
          return ItemTransferencia(_transferencias[indice]);
        },
        itemCount: _transferencias.length,
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                _transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}
