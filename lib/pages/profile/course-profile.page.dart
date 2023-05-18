import 'package:caca_talentos/pages/profile/company-profile.page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caca_talentos/pages/home.page.dart';
import 'package:caca_talentos/pages/profile/user-profile.page.dart';
import 'package:caca_talentos/pages/profile/vacancies-profile.page.dart';

class CourseProfile extends StatelessWidget {
  late String nomeCurso,
      horaCurso,
      compCurriculares,
      periodoCurso,
      descricaoCurso,
      quantVagas;

  getNomeCurso(nomeCurso) {
    this.nomeCurso = nomeCurso;
  }

  getHoraCurso(horaCurso) {
    this.horaCurso = horaCurso;
  }

  getCompCurriculares(compCurriculares) {
    this.compCurriculares = compCurriculares;
  }

  getPeriodoCurso(periodoCurso) {
    this.periodoCurso = periodoCurso;
  }

  getDescricaoCurso(descricaoCurso) {
    this.descricaoCurso = descricaoCurso;
  }

  getQuantVagas(quantVagas) {
    this.quantVagas = quantVagas;
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("curso").doc(nomeCurso);

    // create Map
    Map<String, dynamic> vagas = {
      "nomeCurso": nomeCurso,
      "horaCurso": horaCurso,
      "compCurriculares": compCurriculares,
      "periodoCurso": periodoCurso,
      "descricaoCurso": descricaoCurso,
      "quantVagas": quantVagas,
    };

    documentReference.set(vagas).whenComplete(() {
      print("$nomeCurso Atualizado com sucesso.");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("vaga").doc(nomeCurso);

    documentReference.delete().whenComplete(() {
      print("$nomeCurso deletado com sucesso.");
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
                        'Curso',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        'Divulgue seu curso aqui!',
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
                          getNomeCurso(nomeCurso);
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
                          labelText: "Horário do Curso",
                          prefixIcon: Icon(Icons.access_alarm),
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String horaCurso) {
                          getHoraCurso(horaCurso);
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
                          prefixIcon: Icon(Icons.book),
                          labelText: "Componentes Curriculares",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String compCurriculares) {
                          getCompCurriculares(compCurriculares);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
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
                          getPeriodoCurso(periodoCurso);
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
                          prefixIcon: Icon(Icons.bookmark_add),
                          labelText: "Descrição do Curso",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        onChanged: (String descricaoCurso) {
                          getDescricaoCurso(descricaoCurso);
                        },
                        style: TextStyle(fontSize: 17),
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered_rounded),
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
                                  Color.fromARGB(255, 245, 36, 36),
                                  Color(0XFFF92B7F),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: TextButton(
                              child: Text(
                                "Deletar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                deleteData();
                              },
                            ),
                          ),
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
                                updateData();
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Nome do Curso",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Descrição do Curso",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('curso')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot docSnapshot =
                                    snapshot.data!.docs[index];
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        docSnapshot['nomeCurso'].toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        docSnapshot['descricaoCurso']
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return const Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF230B8B),
              ),
              child: Image.asset(
                'assets/cacatalentoswhite.png', // Caminho da imagem do logo
                height: 60, // Tamanho da imagem
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
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
              title: const Text('Alunos'),
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
              title: const Text('Empresas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyProfile(),
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
                    builder: (context) => VacanciesProfile(),
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
                    builder: (context) => CourseProfile(),
                  ),
                );
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
      ),
    );
  }
}
