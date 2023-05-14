import 'package:flutter/material.dart';
import 'package:caca_talentos/pages/user-profile.page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF230B8B),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF230B8B),
              ),
              // child: Text(
              //   'Menu',
              //   style: TextStyle(
              //     color: Colors.white, // Definindo a cor da letra como branca
              //   ),
              // ),
              child: Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset("assets/cacatalentoswhite.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Home'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Ver Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: const Text('Ver lista de vagas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('Ver lista de Cursos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: const Text('Ver noticias'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
