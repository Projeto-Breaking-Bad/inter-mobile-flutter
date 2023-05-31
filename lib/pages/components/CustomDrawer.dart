import 'package:caca_talentos/pages/list/list-admin.page.dart';
import 'package:caca_talentos/pages/list/list-course.page.dart';
import 'package:caca_talentos/pages/list/list-user.page.dart';
import 'package:caca_talentos/pages/list/list-company.page.dart';
import 'package:caca_talentos/pages/list/list-vacancies.page.dart';
import 'package:caca_talentos/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:caca_talentos/pages/login.page.dart';

class CustomDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final BuildContext context;

  CustomDrawer(this.context);

  Future<void> _signOut() async {
    await _auth.signOut();
    // Navegar para a tela de login ou qualquer outra tela inicial do aplicativo
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF230B8B),
            ),
            child: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/cacatalentoswhite.png',
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: const Text('Administrador'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListAdmin(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Aluno'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListUser(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: const Text('Empresas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCompany(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: const Text('Vagas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListVacancies(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: const Text('Cursos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCourse(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              _signOut();
            },
          ),
        ],
      ),
    );
  }
}
