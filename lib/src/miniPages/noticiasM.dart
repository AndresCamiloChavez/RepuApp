import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repu1/src/Provider/theme_provider.dart';

class NoticiasPageM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
        color: (appTheme.themeDark)?appTheme.themeData.scaffoldBackgroundColor: Colors.white12,
        child: Column(
          children: [
            // _crearTituloNoticia(context),
            SizedBox(
              height: 20,
            ),
            _crearCardNoticia(context),
            _crearCardNoticia(context),
            _crearCardNoticia(context),
            _crearCardNoticia(context),
            _crearCardNoticia(context),
            _crearCardNoticia(context),
            _crearCardNoticia(context),
            _crearCardNoticia(context),

            // _crearCuerpoNoticia(context),
          ],
        ));
  }

  Widget _crearCardNoticia(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        Navigator.pushNamed(context, 'noticia');
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (appTheme.themeDark)?appTheme.themeData.bottomAppBarColor:Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 10, bottom: 30),
                child: Image(
                  height: 100,
                  width: 130,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://urepublicana.edu.co/images/noticias_eventos/1611353638.jpg'),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, right: 50),
                      child: Text(
                        'Titulo de la noticia',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 200,
                          child: Text(
                            'Esto o aquí va el cuerpo de la noticia es una descripcion pequeña',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
