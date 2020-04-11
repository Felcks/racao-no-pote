import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:racao_no_pote/app/modules/home/presentation/pages/backyard_creation/backyard_creation_controller.dart';

class BackyardCreationPage extends StatefulWidget {
  final String title;
  const BackyardCreationPage({Key key, this.title = "Criar quintal"})
      : super(key: key);

  @override
  _BackyardCreationPageState createState() => _BackyardCreationPageState();
}

class _BackyardCreationPageState
    extends ModularState<BackyardCreationPage, BackyardCreationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[300],
                width: 1,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Animal",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Positioned(
                  left: 0,
                  top: 40,
                  child: Text(
                    "Nome",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 60,
                  right: 20,
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      labelText: "",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
