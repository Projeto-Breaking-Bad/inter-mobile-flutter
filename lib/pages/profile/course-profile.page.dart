import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caca_talentos/pages/components/CustomDrawer.dart';
import 'package:caca_talentos/pages/list/list-course.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CourseProfile extends StatefulWidget {
  final String id;

  CourseProfile({required this.id});

  @override
  _CourseProfileState createState() => _CourseProfileState();
}

class _CourseProfileState extends State<CourseProfile> {
  late String nomeCurso,
      horaCurso,
      compCurriculares,
      periodoCurso,
      descricaoCurso,
      quantVagas;

  late TextEditingController nomeCursoController;
  late TextEditingController horaCursoController;
  late TextEditingController compCurricularesController;
  late TextEditingController periodoCursoController;
  late TextEditingController descricaoCursoController;
  late TextEditingController quantVagasController;

  @override
  void initState() {
    super.initState();
    nomeCursoController = TextEditingController();
    horaCursoController = TextEditingController();
    compCurricularesController = TextEditingController();
    periodoCursoController = TextEditingController();
    descricaoCursoController = TextEditingController();
    quantVagasController = TextEditingController();
    fetchCourseData();
  }

  @override
  void dispose() {
    nomeCursoController.dispose();
    horaCursoController.dispose();
    compCurricularesController.dispose();
    periodoCursoController.dispose();
    descricaoCursoController.dispose();
    quantVagasController.dispose();
    super.dispose();
  }

  fetchCourseData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("curso")
        .doc(widget.id)
        .get();

    if (snapshot.exists) {
      setState(() {
        nomeCurso = snapshot['nomeCurso'];
        horaCurso = snapshot['horaCurso'];
        compCurriculares = snapshot['compCurriculares'];
        periodoCurso = snapshot['periodoCurso'];
        descricaoCurso = snapshot['descricaoCurso'];
        quantVagas = snapshot['quantVagas'];
        nomeCursoController.text = nomeCurso;
        horaCursoController.text = horaCurso;
        compCurricularesController.text = compCurriculares;
        periodoCursoController.text = periodoCurso;
        descricaoCursoController.text = descricaoCurso;
        quantVagasController.text = quantVagas;
      });
    }
  }

  updateData(BuildContext context) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("curso").doc(widget.id);

    // create Map
    Map<String, dynamic> vagas = {
      "nomeCurso": nomeCurso,
      "horaCurso": horaCurso,
      "compCurriculares": compCurriculares,
      "periodoCurso": periodoCurso,
      "descricaoCurso": descricaoCurso,
      "quantVagas": quantVagas,
      "id": widget.id,
    };

    documentReference.set(vagas).then((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Atualização realizado'),
            content: Text('Curso atualizado com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListCourse()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      print("Erro ao atualizar $nomeCurso: $error");
    });
  }

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
                              Icons.article,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Atualizar Curso',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        'Atualizar Curso de Usuário logado no sistema',
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
                        controller: nomeCursoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Nome do Curso",
                          prefixIcon: Icon(Icons.card_membership),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String nomeCurso) {
                          setState(() {
                            this.nomeCurso = nomeCurso;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: horaCursoController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskHora],
                        decoration: InputDecoration(
                          labelText: "Horário do Curso",
                          prefixIcon: Icon(Icons.access_alarm),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String horaCurso) {
                          setState(() {
                            this.horaCurso = horaCurso;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: compCurricularesController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.book),
                          labelText: "Componentes Curriculares",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String compCurriculares) {
                          setState(() {
                            this.compCurriculares = compCurriculares;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: periodoCursoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          labelText: "Período do Curso",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String periodoCurso) {
                          setState(() {
                            this.periodoCurso = periodoCurso;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: descricaoCursoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.bookmark_add),
                          labelText: "Descrição do Curso",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String descricaoCurso) {
                          setState(() {
                            this.descricaoCurso = descricaoCurso;
                          });
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: quantVagasController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
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
                      SizedBox(
                        height: 20,
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
