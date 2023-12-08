
import 'package:flutter/material.dart';

import '../main.dart';
import '../services/produtos.dart';

class ItemsWidget extends StatelessWidget {
  final List<Produtos> listProdutos;  // Adicionando final e tipo de lista

  ItemsWidget(this.listProdutos);  // Corrigindo o construtor

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < listProdutos.length; i++)  // Usando o tamanho real da lista
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Paleta.amarelo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-50%",  // Substitua isso com a porcentagem real se necessário
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Paleta.vermelho,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "itemPage");
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/$i.jpg", // Substitua isso pela propriedade real da imagem do produto
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    listProdutos[i].nome,  // Substitua isso pela propriedade real do título do produto
                    style: TextStyle(
                      fontSize: 14,
                      color: Paleta.verdeEscuro,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    listProdutos[i].descricao,  // Substitua isso pela propriedade real da descrição do produto
                    style: TextStyle(
                      fontSize: 13,
                      color: Paleta.verdeEscuro,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "R\$${listProdutos[i].preco}",  // Substitua isso pela propriedade real do preço do produto
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Paleta.verdeEscuro,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Paleta.amarelo,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
