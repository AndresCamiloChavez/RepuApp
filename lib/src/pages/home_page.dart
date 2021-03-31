import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:repu1/src/Provider/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  // final _controler = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _pagina1(context),
          _pagina2(context),
        ],
      ),
    );
  }

  Widget _pagina1(BuildContext context) {
    //final double pantalla = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(139, 53, 61, 0.94), //Colors.blue[700],
      child: Column(
        children: [
          _textImagen(context),
          _parteAbajo(context),
        ],
      ),
    );
  }

  Widget _textImagen(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),

        height:
            media.height * 0.52, //322, modifique el tamaño en otro dispositivo
        width: double.infinity,
        child: Column(
          children: [
            SafeArea(
              child: Text(
                'Bienvenido',
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromRGBO(139, 53, 61, 1.0),
                    fontWeight: FontWeight.bold // Colors.blue[700],
                    ),
              ),
            ),
            _imagenFondo(context),
          ],
        ),
      ),
    );
  }

  Widget _imagenFondo(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      //  padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
      width: media.width * 0.64,
      height: media.height * 0.40,
      child: Image(
        image: AssetImage('assets/estudio.gif'),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _parteAbajo(BuildContext context) {
    final media = MediaQuery.of(context).size;
    // final appTheme = Provider.of<ThemeChanger>(context);
    return Expanded(
      child: Container(
        height: 200,
        padding: EdgeInsets.only(top: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: Container(
            padding: EdgeInsets.only(
              right: 15,
              left: 15,
              top: media.height * 0.03,
            ),
            width: media.width * 0.856,

            //   height: media.height * 0.559294, //255 modifique el tamaño,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Corporación Universitaria Republicana',
                  style: TextStyle(
                      color: Colors.black, //Colors.blue[800],
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(
                  height: media.height * 0.04,
                ),
                Container(
                  height: media.height * 0.07,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                     shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                     backgroundColor: MaterialStateProperty.all<Color>( Color.fromRGBO(139, 53, 61, 1.0),),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.black)

                     ),
                      
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    
                    child: Text('Iniciar Sesión'),
                  ),
                ),
                SizedBox(height: media.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          color:Colors.black,
                          height: 50,
                        ),
                      ),
                    ),
                    Text(
                      'Más información',
                      style: TextStyle(fontSize: 14,
                      color: Colors.black
                      )
                      ,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          color: Colors.black,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      color:  Colors.black,
                      splashColor: Colors.blue,
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                     
                      child: Image(
                        height: 30,
                        width: 30,
                        image: AssetImage('assets/logo.png'),
                      ),
                    
                      onPressed: () {
                        launch('https://urepublicana.edu.co/');
                      },
                    ),
                    IconButton(
                      color: Colors.black,
                      splashColor: Colors.blue,
                      icon: Icon(Icons.email),
                      onPressed: () {
                        launch('https://urepublicana.edu.co/');
                      },
                    ),
                  ],
                ),
                IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  iconSize: media.height * 0.07,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(139, 53, 61, 0.95), //Colors.blue[700],

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: media.width * 0.0722, right: media.width * 0.0722),
            // padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.white, //Colors.blue[700],
            ),
            height: media.height * 0.21,
            width: 400.0,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      style: TextStyle(
                          color: Color.fromRGBO(139, 53, 61, 0.95),
                          fontSize: 31.0,
                          fontWeight: FontWeight.bold),
                      text: 'Corporación'),
                  TextSpan(
                      style: TextStyle(
                          color: Color.fromRGBO(215, 146, 105, 1.0),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                      text: '\nUniversitaria'),
                  TextSpan(
                      style: TextStyle(
                          color: Color.fromRGBO(182, 99, 37, 1.0),
                          fontSize: 31.0,
                          fontWeight: FontWeight.bold),
                      text: '\nRepublicana'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            // height: double.infinity,
            height: media.height * 0.717,

            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      text: 'La misión Institucional de la '),
                  TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      text: 'CORPORACIÓN UNIVERSITARIA REPUBLICANA '),
                  TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      text:
                          'apunta esencialmente a la preparación integral de nuestros educandos, mediante estrategias participativas de enseñanza, aprendizaje y formación, que integren la docencia, la investigación y la extensión, dentro de claros principios humanísticos, éticos y ecológicos, para viabilizar el progreso individual y colectivo, en todos los campos del saber, acordes con el carácter institucional legalmente reconocido.'),
                  TextSpan(
                      style: TextStyle(fontSize: 22, color: Colors.black),
                      text: '\n\n Más información en:'),
                  TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch('https://urepublicana.edu.co/');
                        },
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                      text: ' \n https://urepublicana.edu.co/'),
                ])),
          )
        ],
      ),
    );
  }
}
