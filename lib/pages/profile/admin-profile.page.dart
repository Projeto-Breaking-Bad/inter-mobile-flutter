import 'package:caca_talentos/pages/components/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caca_talentos/pages/home.page.dart';
import 'package:caca_talentos/pages/list/list-admin.page.dart';

class AdminProfile extends StatefulWidget {
  final String id;

  AdminProfile({required this.id});

  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  late String nome, instituicao, email, senha;
  late TextEditingController nomeController;
  late TextEditingController instituicaoController;
  late TextEditingController emailController;
  late TextEditingController senhaController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    instituicaoController = TextEditingController();
    emailController = TextEditingController();
    senhaController = TextEditingController();
    fetchUserData();
  }

  @override
  void dispose() {
    nomeController.dispose();
    instituicaoController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  fetchUserData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("admin")
        .doc(widget.id)
        .get();

    if (snapshot.exists) {
      setState(() {
        nome = snapshot['nome'];
        instituicao = snapshot['instituicao'];
        email = snapshot['email'];
        senha = snapshot['senha'];
        nomeController.text = nome;
        instituicaoController.text = instituicao;
        emailController.text = email;
        senhaController.text = senha;
      });
    }
  }

  updateData(BuildContext context) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("admin").doc(widget.id);

    // create Map
    Map<String, dynamic> admins = {
      "nome": nome,
      "instituicao": instituicao,
      "email": email,
      "senha": senha,
      "id": widget.id,
    };

    documentReference.update(admins).then((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Atualização realizado'),
            content: Text('Admin atualizado com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListAdmin()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      print("Erro ao atualizar $nome: $error");
    });
  }

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
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/5199419.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Icon(
                              Icons.show_chart,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Atualizar Perfil',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        'Atualizar Perfil de Admin logado no sistema',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextFormField(
                        controller: nomeController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          prefixIcon: Icon(Icons.people),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String nome) {
                          setState(() {
                            this.nome = nome;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: instituicaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Instituição",
                          prefixIcon: Icon(Icons.school),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String instituicao) {
                          setState(() {
                            this.instituicao = instituicao;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          prefixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String email) {
                          setState(() {
                            this.email = email;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: senhaController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String senha) {
                          setState(() {
                            this.senha = senha;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.3, 1],
                                colors: [
                                  Color(0xFFF58524),
                                  Color(0XFFF92B7F),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: TextButton(
                              child: Text(
                                "Atualizar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                updateData(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(context),
    );
  }
}
