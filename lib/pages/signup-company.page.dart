import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caca_talentos/pages/signup.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupCompanyPage extends StatelessWidget {
  late String nome, cnpj, email, senha;

  getNome(nome) {
    this.nome = nome;
  }

  getCnpj(cnpj) {
    this.cnpj = cnpj;
  }

  getEmail(email) {
    this.email = email;
  }

  getSenha(senha) {
    this.senha = senha;
  }

  createData(BuildContext context) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("empresa");

    // create Map
    Map<String, dynamic> empresas = {
      "nome": nome,
      "cnpj": cnpj,
      "email": email,
      "senha": senha,
    };

    try {
      await collectionReference.add(empresas);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cadastro realizado com sucesso'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Erro ao cadastrar empresa: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro ao cadastrar empresa'),
            content: Text(
                'Ocorreu um erro ao cadastrar a empresa. Por favor, tente novamente.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset("assets/cacatalentoswhite.png"),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Cadastro de Empresa',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ), // adiciona um espaço entre os textos
                      Text(
                        'Faça seu cadastro aqui.',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey[400],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // alinha os botões no centro horizontal
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ),
                                );
                              },
                              child: Text('Aluno'),
                            ),
                            SizedBox(
                                width:
                                    10), // define a largura do espaço entre os botões
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Empresa'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
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
                          getNome(nome);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        inputFormatters: [maskFormatter],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "CNPJ",
                          prefixIcon: Icon(Icons.card_membership_sharp),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String cnpj) {
                          getCnpj(cnpj);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
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
                          getEmail(email);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
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
                          getSenha(senha);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
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
                        child: SizedBox.expand(
                          child: TextButton(
                            child: Text(
                              "Cadastrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              createData(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Text(
                            "Cancelar",
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
