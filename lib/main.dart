import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({Key? key}) : super(key: key);

  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Número da conta',
                hintText: '00000-0',
                icon: Icon(Icons.person),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
              style: const TextStyle(
                fontSize: 20.0,
              ),
              controller: _controladorNumeroConta,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor',
                hintText: '0.00',
                icon: Icon(Icons.monetization_on),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
              style: const TextStyle(
                fontSize: 20.0,
              ),
              controller: _controladorValor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  debugPrint(
                      "Número da Conta: ${_controladorNumeroConta.text}");
                  debugPrint("Valor: ${_controladorValor.text}");

                  final int numeroConta =
                      int.tryParse(_controladorNumeroConta.text) ?? 0;
                  final double valor =
                      double.tryParse(_controladorValor.text) ?? 0;

                  if (numeroConta > 0 && valor > 0) {
                    final transferenciaCriada =
                        Transferencia(numeroConta, valor);
                    debugPrint(transferenciaCriada.toString());
                  }
                },
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemTransferencia(Transferencia(10001 - 0, 100.00)),
          ItemTransferencia(Transferencia(20002 - 0, 200.00)),
          ItemTransferencia(Transferencia(30003 - 0, 300.00)),
          ItemTransferencia(Transferencia(40004 - 0, 400.00)),
        ],
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          debugPrint('button pressed');
        },
      ),
    );
  }
}

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

class Transferencia {
  final int numeroConta;
  final double valor;

  Transferencia(this.numeroConta, this.valor);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia($numeroConta, $valor)';
  }
}
