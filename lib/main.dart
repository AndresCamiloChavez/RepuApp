import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:repu1/src/Provider/theme_provider.dart';
import 'package:repu1/src/miniPages/noticia.dart';
import 'package:repu1/src/pages/home_page.dart';
import 'package:repu1/src/pages/inicio_page.dart';
import 'package:repu1/src/pages/login_page.dart';
import 'package:repu1/src/preferencias_prefs/preferencias_usuario.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  
  
 runApp(ChangeNotifierProvider(
  create: (_) => ThemeChanger(prefs.temaActual),
  child: MyApp()));}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      //  statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'inicio': (BuildContext context) => InicioPage(),
        'login': (BuildContext context) => LoginPage(),
        'noticia': (BuildContext context) => Noticia(),
      },
      home: HomePage(),
      theme: appTheme.themeData,
    );
  }
}
/* 
return Stack(
      children: [
        _colorFondo(),
        //_imagenFondo(),
        Container(
          height: 200,
          width: 200,
          padding: EdgeInsets.only(right: 30, left: 30, top: 100),
          color: Colors.redAccent,
        ),
        _textos(),
      ],
    ); */
