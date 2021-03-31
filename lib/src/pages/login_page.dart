import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repu1/src/Provider/theme_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visto = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
        body: Container(
      // alignment: Alignment.bottomCenter,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
            Color.fromRGBO(139, 53, 61, 1.0),
            Color.fromRGBO(182, 91, 97, 1.0),
            Color.fromRGBO(239, 182, 109, 1.0),
            Color.fromRGBO(234, 127, 54, 1.0),
          ])),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height * 0.70,
            width: double.infinity,
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              color: (appTheme.themeDark) ? Colors.black: Colors.white,
            ),
          ),
          Positioned(
            top: size.height * 0.14,
            child: Image(
              height: size.height * 0.25,
              width: size.width * 0.40,
              image: AssetImage('assets/logo.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            // top: size.height * 0.10,
            // bottom: size.height * 0.14,
            child: SingleChildScrollView(
              child: Container(
                color: (appTheme.themeDark) ? Colors.black38: Colors.white,
                height: size.height * 0.60,
                width: size.width * 0.86,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _crearInputs(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _crearInputs(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final size = MediaQuery.of(context).size;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: size.width * 0.13),
      // height: size.height * 0.4,
      color: (appTheme.themeDark) ? Colors.black38: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                    color: (appTheme.themeDark)? Colors.white60:Color.fromRGBO(148, 68, 76, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            _inputUsuario(context),
            SizedBox(
              height: 10,
            ),
            _inputContrase(context),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.4),
              // height: 50,
              child: TextButton(
                  onPressed: () {}, child: Text('¿Olvidaste la Contraseña?',style: TextStyle(
                    color: (appTheme.themeDark)? Colors.white60:Color.fromRGBO(148, 68, 76, 1.0),
                  ),),),
            ),
            _botonLogin(context)
          ],
        ),
      ),
    );
  }

  Widget _inputUsuario(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: Color.fromRGBO(139, 53, 61, 1.0)),
      child: TextField(
        style: TextStyle(fontSize: 15),
        cursorColor: Colors.amber,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.amber, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: 'Usuario',
          hintText: 'Codigó o Usuario',
        ),
      ),
    );
  }

  Widget _inputContrase(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color.fromRGBO(139, 53, 61, 1.0),
      ),
      child: TextField(
        obscureText: visto,
        style: TextStyle(
          fontSize: 15,
        ),
        cursorColor: Colors.redAccent,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  visto = !visto;
                });
              }),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.amber, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: 'Contraseña',
          hintText: 'Contraseña',
        ),
      ),
    );
  }

  Widget _botonLogin(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(0),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
       style: ButtonStyle(
         shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                     backgroundColor: MaterialStateProperty.all<Color>( Color.fromRGBO(139, 53, 61, 1.0),),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.black)
     
       
       ),
        child: Text('Ingresar'),
        onPressed: () {
          Navigator.pushNamed(context, 'inicio');
        },
      ),
    );
  }
}
