class Pagamento {
  void pagar(TipoPagamento tipoPagamento) {
    if (tipoPagamento.toValue() == 'Pix') {
      print('pagou com pix');
    }
  }
}

enum TipoPagamento { PIX, BOLETO, CARTAO }

extension ExtensionTipoPagamento on TipoPagamento {
  String toValue() {
    Map map = {
      TipoPagamento.PIX: 'Pix',
      TipoPagamento.BOLETO: 'Boleto',
      TipoPagamento.CARTAO: 'Cartao',
    };

    return map[this];
  }
}

extension ExtensionString on String {
  String toFirstCharToUpperCase() {
    return this[0].toUpperCase() + substring(1);
  }
}
