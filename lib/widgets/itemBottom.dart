
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ItemBottom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      child: Container(

        padding: EdgeInsets.all(20),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0,3),
            )
          ]
        ),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "R\$ 100",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Paleta.amarelo,
              ),
            ),



            ElevatedButton.icon(onPressed: (){},
              style: ButtonStyle(
               backgroundColor: MaterialStatePropertyAll<Color>(Paleta.verdeEscuro),

              ),
              icon: Icon(CupertinoIcons.cart_badge_plus, color: Colors.white,),
              label: Text("Adicionar ao carrinho", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),

            ),

          ],
        ),
      ),
    );
  }
}
