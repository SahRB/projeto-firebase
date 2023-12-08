
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CartItems extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i< 4;i++)
        Container(
          height:110,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(value: "", groupValue: "",
                  activeColor: Paleta.verdeEscuro,
                  onChanged: (index){},


                ),

              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("../assets/images/$i.jpg"),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Titulo produto",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Paleta.verdeEscuro,
                      ),
                    ),
                    Text("R\$ 55", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                    color: Paleta.verdeEscuro,
                    ),),
                  ],
                ),
              ),

              Spacer(),
              
              Padding(padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.delete, color: Paleta.vermelho,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ]
                          ),
                          child: Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                        Container(margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "01",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ]
                          ),
                          child: Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        )
                      ],
                    )
                  ],),
              )
            ],
          ),
        ),
      ],
    );
  }
}
