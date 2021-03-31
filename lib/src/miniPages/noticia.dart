import 'package:flutter/material.dart';

class Noticia extends StatelessWidget {
  const Noticia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.3,
              width: double.infinity,
              color: Colors.red,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://urepublicana.edu.co/images/noticias_eventos/1611353638.jpg'),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.7,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Titulo de la noticia',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'La Corporación Universitaria Republicana, con el objetivo de optimizar sus procesos de inscripción de materias, ha dispuesto una PRIMERA JORNADA DE INSCRIPCIÓN DE MATERIAS, la cual permite que los estudiantes que se encuentren matriculados para el Primer Periodo Académico de 2021-1 puedan adelantar su proceso de inscripción de materias antes de las fechas habituales que maneja la Institución. Lo anterior con el objetivo que toda la comunidad estudiantil no inscriba materias al mismo tiempo, evitando así posibles congestiones e inconvenientes en este proceso. Los invitamos a legalizar su matrícula antes de la fecha establecida para su programa y semestre y poder así adelantar su proceso de inscripción de materias. Las fechas programadas para esta Primera Jornada, son las siguientes:',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
