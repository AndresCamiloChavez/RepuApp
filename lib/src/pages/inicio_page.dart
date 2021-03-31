import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:repu1/src/Provider/theme_provider.dart';
import 'package:repu1/src/miniPages/noticiasM.dart';
import 'package:repu1/src/miniPages/radioM.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  double porcentaje = 0.10;
  int posicionPantalla = 0;


  @override
  void initState() { 
    super.initState();
    _cargarPrefs();

    
    
  }

  _cargarPrefs()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Provider.of<ThemeChanger>(context,listen: false).numTema = prefs.getInt('temaA');

    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        
        physics: BouncingScrollPhysics(),
        slivers: [
          _crearAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            getDrawerItemWidget(posicionPantalla),
          ])),
        ],
      ),
      drawer: _crearDrawer(),
    );
  }

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return NoticiasPageM();
      case 1:
        return RadioPageM();
    }
  }

  void _seleccion(int posicion) {
    setState(() {
      posicionPantalla = posicion;
    });
  }

  Widget _crearAppBar() {
    return SliverAppBar(
      backgroundColor: Color.fromRGBO(139, 53, 61, 1.0),
      brightness: Brightness.dark,

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: double.infinity,
          width: double.infinity,
          child: Swiper(
            autoplay: true,
            itemCount: 2,
            layout: SwiperLayout.DEFAULT,
            itemBuilder: (BuildContext context, i) {
              return Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://urepublicana.edu.co/images/noticias_eventos/1611353638.jpg'),
              );
            },
            duration: 1500,
            containerHeight: double.infinity,
            containerWidth: double.infinity,
            curve: Curves.easeOutQuad, //ease
          ),
        ),
        centerTitle: true,
        // title: Text('Noticias'),Andrescamilo8
      ),

      elevation: 2.0,
      //backgroundColor: Colors.amberAccent,
      snap: false,
      stretch: false,
      floating: true,
      pinned: false,
      expandedHeight: 100.0,
    );
  }

  Widget _crearDrawer() {
    return Drawer(
      elevation: 1.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            arrowColor: Colors.red,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.redAccent, BlendMode.darken), //darken
                  image: NetworkImage(
                      'https://asociaciondec.org/wp-content/uploads/2018/10/Los-universitarios-un-p%C3%BAblico-objetivo-muy-atractivo-para-los-bancos-thegem-blog-default.jpg')),
              //color: Color.fromRGBO(139, 79, 71, 1.0),
            ),
            accountName: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Andres Camilo',
                  style: TextStyle(fontSize: 18),
                ),
                Text('Ing. Sistemas'),
              ],
            ),
            accountEmail: Text('andres@Urepublicana.com.co'),
            currentAccountPicture: InkWell(
              onTap: () {
                setState(() {});
                porcentaje += 0.05;
                if (porcentaje > 1.0) {
                  porcentaje = 0.0;
                }
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg?itok=fl2H3Opv',
                ),
                child: CircularPercentIndicator(
                  radius: 72,
                  animation: true,
                  backgroundWidth: 6,
                  animationDuration: 1200,
                  percent: porcentaje,
                  // circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.deepOrangeAccent,
                  backgroundColor: Colors.amber,
                ),

                /*   Text(
                    'AC',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500), */
              ),
            ),
          ),
          /* DrawerHeader(
            child: Text('Jian'),
            decoration: BoxDecoration(color: Colors.red),
          ), */

          _creandoList(Icons.notifications_active_outlined, 'Noticias', 0),
          _creandoList(Icons.radio_outlined, 'Radio Republicana', 1),

          // RaisedButton(onPressed: () {}),
          ListTile(
            leading: Icon(Icons.sticky_note_2_outlined),
            title: Text('Notas'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: Text('Campus Virtual'),
            onTap: () {},
          ),
           _SwitchTheme()
        ],
      ),
    );
  }

  Widget _creandoList(IconData icon, String texto, int pos) {
    return Column(
      children: [
        ListTile(
          selected: (pos == posicionPantalla),
          leading: Icon(icon),
          title: Text(texto),
          onTap: () {
            setState(() {
              Navigator.of(context).pop();
              _seleccion(pos);
            });
          },
        ),
        Divider(
          thickness: 1,
          height: 10,
        )
      ],
    );
  }
}

class _SwitchTheme extends StatefulWidget {
  const _SwitchTheme({
    Key key,
  }) : super(key: key);



  @override
  __SwitchThemeState createState() => __SwitchThemeState();
}

class __SwitchThemeState extends State<_SwitchTheme> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return ListTile(
     leading: Icon(Icons.phone_android),
     title: Text('Modo Oscuro'),
     trailing: Switch.adaptive(value: appTheme.themeDark, 
     onChanged: (value)async{
       appTheme.themeDark= value;
         SharedPreferences prefs =await SharedPreferences.getInstance();

         prefs.setInt('temaA', appTheme.numTema);
         setState(() {
           
         });


     }),
    
          );
  }
}
