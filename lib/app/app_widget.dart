import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Ração no Pote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff4CAF50),
        primaryColorDark: Color(0xff388E3C),
        accentColor: Colors.teal,
        textTheme: GoogleFonts.sarabunTextTheme(Theme.of(context).textTheme).copyWith(),
        iconTheme: IconThemeData(
          color: Colors.teal
        ),
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.sarabunTextTheme(Theme.of(context).textTheme).copyWith(
            title: TextStyle(color: Colors.teal, fontSize: 20)
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.teal
          ),
          iconTheme: IconThemeData(
            color: Colors.teal
          )
        )
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
