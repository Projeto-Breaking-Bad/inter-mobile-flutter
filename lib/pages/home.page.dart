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
      ),
      drawer: CustomDrawer(context), // Adicione o CustomDrawer aqui
      body: const Center(
        child: Text('My Page!'),
      ),
    );
  }
}
