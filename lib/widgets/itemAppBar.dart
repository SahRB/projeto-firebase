
import 'package:flutter/material.dart';

import '../main.dart';

class ItemAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, size: 30, color: Paleta.verdeEscuro,),

          ),
          Padding(padding: EdgeInsets.only(left: 20),
            child: Text("Produto", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold ),),
          ),
          Spacer(),
          Icon(
            Icons.favorite, size: 30, color: Paleta.vermelho,
          )
        ],
      ),
    );
  }
}
