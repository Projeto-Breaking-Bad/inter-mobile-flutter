import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caca_talentos/pages/components/CustomDrawer.dart';

class VacanciesProfile extends StatefulWidget {
  final String id;

  VacanciesProfile({required this.id});

  @override
  _VacanciesProfileState createState() => _VacanciesProfileState();
}

class _VacanciesProfileState extends State<VacanciesProfile> {
  late String areaAtuacao,
      horas,
      salario,
      descricao,
      requisitos,
      cnpj,
      quantVagas;
  late TextEditingController areaAtuacaoController;
  late TextEditingController horasController;
  late TextEditingController salarioController;
  late TextEditingController descricaoController;
  late TextEditingController requisitosController;
  late TextEditingController cnpjController;
  late TextEditingController quantVagasController;

  @override
  void initState() {
    super.initState();
    areaAtuacaoController = TextEditingController();
    horasController = TextEditingController();
    salarioController = TextEditingController();
    descricaoController = TextEditingController();
    requisitosController = TextEditingController();
    cnpjController = TextEditingController();
    quantVagasController = TextEditingController();
    fetchVacancies();
  }

  @override
  void dispose() {
    super.dispose();
    areaAtuacaoController.dispose();
    horasController.dispose();
    salarioController.dispose();
    descricaoController.dispose();
    requisitosController.dispose();
    cnpjController.dispose();
    quantVagasController.dispose();
    super.dispose();
  }

  fetchVacancies() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("vaga")
        .doc(widget.id)
        .get();

    if (snapshot.exists) {
      setState(() {
        areaAtuacao = snapshot['areaAtuacao'];
        horas = snapshot['horas'];
        salario = snapshot['salario'];
        descricao = snapshot['descricao'];
        requisitos = snapshot['requisitos'];
        cnpj = snapshot['cnpj'];
        quantVagas = snapshot['quantVagas'];
        areaAtuacaoController.text = areaAtuacao;
        horasController.text = horas;
        salarioController.text = salario;
        descricaoController.text = descricao;
        requisitosController.text = requisitos;
        cnpjController.text = cnpj;
        quantVagasController.text = quantVagas;
      });
    }
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("vaga").doc(widget.id);

    // create Map
    Map<String, dynamic> vagas = {
      "areaAtuacao": areaAtuacao,
      "cnpj": cnpj,
      "horas": horas,
      "salario": salario,
      "descricao": descricao,
      "requisitos": requisitos,
      "quantVagas": quantVagas,
      "id": widget.id,
    };

    documentReference.update(vagas).then((_) {
      print("$areaAtuacao atualizado com sucesso.");
    }).catchError((error) {
      print("Erro ao atualizar $areaAtuacao: $error");
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
                            child: Image.asset("assets/user.png"),
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
                        controller: cnpjController,
                        keyboardType: TextInputType.emailAddress,
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
                          setState(() {
                            this.cnpj = cnpj;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: areaAtuacaoController,
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
                          setState(() {
                            this.areaAtuacao = areaAtuacao;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: horasController,
                        keyboardType: TextInputType.text,
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
                          setState(() {
                            this.horas = horas;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: salarioController,
                        keyboardType: TextInputType.text,
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
                          setState(() {
                            this.salario = salario;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: requisitosController,
                        keyboardType: TextInputType.text,
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
                          setState(() {
                            this.requisitos = requisitos;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: quantVagasController,
                        keyboardType: TextInputType.text,
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
                          setState(() {
                            this.quantVagas = quantVagas;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: descricaoController,
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
                          setState(() {
                            this.descricao = descricao;
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
                                updateData();
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
