



import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {


  static final PreferenciasUsuario _instancia = new PreferenciasUsuario.internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario.internal();

  SharedPreferences _prefs;

  initPrefs() async {

    this._prefs = await SharedPreferences.getInstance();

  }

  int get temaActual => _prefs.getInt('temaA');

  set temaActual(int value){
    _prefs.setInt('temaA', value);
  }

}