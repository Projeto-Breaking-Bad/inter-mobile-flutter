import 'package:caca_talentos/pages/list/list-vacancies.page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caca_talentos/pages/components/CustomDrawer.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class VacanciesProfile extends StatelessWidget {
  final String id;

  VacanciesProfile({required this.id});

  late String cnpj,
      areaAtuacao,
      horas,
      salario,
      descricao,
      requisitos,
      quantVagas;

  getCnpj(cnpj) {
    this.cnpj = cnpj;
  }

  getAreaAtuacao(areaAtuacao) {
    this.areaAtuacao = areaAtuacao;
  }

  getHoras(horas) {
    this.horas = horas;
  }

  getSalario(salario) {
    this.salario = salario;
  }

  getDescricao(descricao) {
    this.descricao = descricao;
  }

  getRequisitos(requisitos) {
    this.requisitos = requisitos;
  }

  getQuantVagas(quantVagas) {
    this.quantVagas = quantVagas;
  }

  createData(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("vaga");

    // create Map
    Map<String, dynamic> vagas = {
      "cnpj": cnpj,
      "areaAtuacao": areaAtuacao,
      "horas": horas,
      "salario": salario,
      "descricao": descricao,
      "requisitos": requisitos,
      "quantVagas": quantVagas,
    };

    collectionReference.add(vagas).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cadastro realizado'),
            content: Text('Vaga cadastrada com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListVacancies()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      print("Falha ao cadastrar o usuário: $error");
    });
  }

  var maskCnpj = new MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskHora = new MaskTextInputFormatter(
      mask: '##:##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF230B8B),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
                              Icons.book,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Vagas da Empresaa',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        'Vagas da Empresa logado no sistema',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskCnpj],
                        decoration: InputDecoration(
                          labelText: "CNPJ",
                          prefixIcon: Icon(Icons.people),
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
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Área de Atuação",
                          prefixIcon: Icon(Icons.token),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String areaAtuacao) {
                          getAreaAtuacao(areaAtuacao);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskHora],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.timer),
                          labelText: "Horas",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String horas) {
                          getHoras(horas);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.money),
                          labelText: "Salário",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String salario) {
                          getSalario(salario);
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
                          prefixIcon: Icon(Icons.list_alt),
                          labelText: "Requisitos",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String requisitos) {
                          getRequisitos(requisitos);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.add_chart),
                          labelText: "Quantidade de Vagas",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String quantVagas) {
                          getQuantVagas(quantVagas);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.description),
                          labelText: "Descrição",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String descricao) {
                          getDescricao(descricao);
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
