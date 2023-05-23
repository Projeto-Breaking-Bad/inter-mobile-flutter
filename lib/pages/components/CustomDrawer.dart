import 'package:caca_talentos/pages/list/list-user.page.dart';
import 'package:caca_talentos/pages/list/list-company.page.dart';
import 'package:caca_talentos/pages/list/list-vacancies.page.dart';
import 'package:caca_talentos/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:caca_talentos/pages/profile/user-profile.page.dart';
import 'package:caca_talentos/pages/profile/company-profile.page.dart';
import 'package:caca_talentos/pages/profile/course-profile.page.dart';

class CustomDrawer extends StatelessWidget {
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
            child: Image.asset(
              'assets/cacatalentoswhite.png',
              height: 60,
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
