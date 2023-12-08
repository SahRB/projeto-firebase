import 'package:flutter/material.dart';

class Produtos {
  String id;
  String nome;
  String descricao;
  double preco;
  int estoque; // Agora, o campo de estoque é um inteiro

  Produtos({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.estoque,
  });

  // Construtor adicional para criar um objeto Produtos a partir de um mapa
  Produtos.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        descricao = map["descricao"],
        preco = map["preco"].toDouble(),
        estoque = map["estoque"];
}
