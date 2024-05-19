import 'package:caca_talentos/pages/components/CustomDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF230B8B),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/cacatalentoswhite.png',
                width: 60, // ajuste o tamanho conforme necessário
              ),
            ),
          ],
        ),
      drawer: CustomDrawer(context), // Adicione o CustomDrawer aqui
      body: const Center(
        child: Text('Em Desenvolvimento!'),
      ),
    );
  }
}
