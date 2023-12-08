import 'package:flutter/material.dart';
import 'addProduto.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EditarExcluirProduto extends StatefulWidget {
  @override
  _EditarExcluirProdutoState createState() => _EditarExcluirProdutoState();
}

class _EditarExcluirProdutoState extends State<EditarExcluirProduto> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<QueryDocumentSnapshot> listaProdutos;

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  Future<void> _carregarProdutos() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection("produtos").get();

    setState(() {
      listaProdutos = snapshot.docs;
    });
  }

  Future<void> _editarProduto(BuildContext context, String produtoId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProduto(produtoId: produtoId),
      ),
    );

    // Após a edição, recarrega a lista
    _carregarProdutos();
  }

  Future<void> _excluirProduto(
      BuildContext context, String produtoId) async {
    await _firestore.collection("produtos").doc(produtoId).delete();

    // Exiba um snackbar para indicar que o produto foi excluído com sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Produto excluído com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );

    // Após a exclusão, recarrega a lista
    _carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: listaProdutos != null
          ? ListView.builder(
        itemCount: listaProdutos.length,
        itemBuilder: (context, index) {
          QueryDocumentSnapshot produto = listaProdutos[index];

          return ListTile(
            title: Text(produto['nome']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editarProduto(context, produto.id);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    // Aguarde a confirmação da exclusão
                    bool confirmacao = await _confirmarExclusao(context);

                    if (confirmacao) {
                      _excluirProduto(context, produto.id);
                    }
                  },
                ),
              ],
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> _confirmarExclusao(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar exclusão'),
        content: Text('Tem certeza de que deseja excluir este produto?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // Cancelar
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true); // Confirmar
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
