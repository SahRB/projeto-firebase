
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../main.dart';
import '../widgets/profileAppBar.dart';
import 'addProduto.dart';
import 'editarProduto.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ProfileAppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(3),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: AssetImage("assets/images/avatar.jpg"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Nome",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Artesão - Brasileiro - Português "),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Editar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Paleta.verdeEscuro,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            SizedBox(height: 10),
            ProfileMenu(
              icon: LineIcons.cog,
              text: "Configurações",
              onTap: () {

              },
            ),
            SizedBox(height: 10),
            ProfileMenu(
              icon: LineIcons.user,
              text: "Dados Pessoais",
              onTap: () {
                // Navegar para a página de dados pessoais quando o item do menu é clicado


              },
            ),
            SizedBox(height: 10),
            ProfileMenu(
              icon: LineIcons.bell,
              text: "Notificações",
              onTap: () {


              },
            ),
            SizedBox(height: 10),
            ProfileMenu(
              icon: LineIcons.alternateList,
              text: "Gerenciar vendas",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarExcluirProduto(),
                    )
                );
              },
            ),
            SizedBox(height: 10),
            ProfileMenu(
              icon: Icons.add,
              text: "Adicionar produto",
              onTap: () {
                // Navegar para a página de adição de produto quando o item do menu é clicado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProduto(  ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ProfileMenu(
              icon: LineIcons.globe,
              text: "Requisitar agência de comércio exterior",
              onTap: () {
                // Navegar para a página de requisição de comércio exterior quando o item do menu é clicado

              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const ProfileMenu({
    required this.icon,
    required this.text,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Paleta.amarelo.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Paleta.verdeEscuro,
          size: 18,
        ),
      ),
      title: Text(text),
      trailing: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Paleta.amarelo.withOpacity(0.1),
        ),
        child: Icon(
          LineIcons.angleRight,
          size: 18,
          color: Paleta.amarelo,
        ),
      ),
    );
  }
}
