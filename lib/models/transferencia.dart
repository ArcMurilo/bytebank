class Transferencia {
  final String numeroConta;
  final double valor;

  Transferencia(this.numeroConta, this.valor);

  @override
  String toString() {
    return 'Transferencia($numeroConta, $valor)';
  }
}
