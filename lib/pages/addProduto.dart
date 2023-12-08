import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduto extends StatefulWidget {
  final String? produtoId;

  const AddProduto({Key? key, this.produtoId}) : super(key: key);

  @override
  _AddProdutoState createState() => _AddProdutoState();
}

class _AddProdutoState extends State<AddProduto> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _saveProduct() async {
    String nome = nomeController.text;
    double preco = double.parse(precoController.text);
    int quantidade = int.parse(quantidadeController.text);
    String descricao = descricaoController.text;

    CollectionReference produtos = FirebaseFirestore.instance.collection('produtos');

    try {
      if (widget.produtoId != null) {
        await produtos.doc(widget.produtoId).update({
          'nome': nome,
          'preco': preco,
          'estoque': quantidade,
          'descricao': descricao,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Produto editado com sucesso!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        await produtos.add({
          'nome': nome,
          'preco': preco,
          'estoque': quantidade,
          'descricao': descricao,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Produto adicionado com sucesso!'),
            duration: Duration(seconds: 2),
          ),
        );
      }

      nomeController.clear();
      precoController.clear();
      quantidadeController.clear();
      descricaoController.clear();
      setState(() {
        _image = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar o produto. Tente novamente.'),
          duration: Duration(seconds: 2),
        ),
      );
      print('Erro ao salvar o produto: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produtoId != null ? 'Editar Produto' : 'Adicionar Produto'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _image == null
                      ? Placeholder(
                    fallbackHeight: 120,
                    fallbackWidth: 120,
                  )
                      : CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(_image!),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: Text('Escolher Foto'),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(labelText: 'Nome do Produto'),
                  ),
                  TextFormField(
                    controller: precoController,
                    decoration: InputDecoration(labelText: 'Preço'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: quantidadeController,
                    decoration: InputDecoration(labelText: 'Quantidade'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: descricaoController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                    maxLines: 3,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _saveProduct();
                    },
                    child: Text(widget.produtoId != null ? 'Confirmar Edição' : 'Salvar Produto'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
