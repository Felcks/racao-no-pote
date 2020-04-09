import 'package:flutter/material.dart';
import 'package:racao_no_pote/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:timezone/data/latest.dart';

SharedPreferences sp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sp = await SharedPreferences.getInstance();
  initializeTimeZones();
  runApp(ModularApp(module: AppModule()));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashScreen(
        seconds: 1,
        navigateAfterSeconds: Modular.to.pushReplacementNamed,
        backgroundColor: Colors.white,
        image: Image.asset("assets/splash.jpg"),
        styleTextUnderTheLoader: TextStyle(),
        loaderColor: Colors.white,
        photoSize: 200.0,
      ),
    );
  }
}
