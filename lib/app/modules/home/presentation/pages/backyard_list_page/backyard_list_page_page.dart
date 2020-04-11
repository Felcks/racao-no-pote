import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BackyardListPage extends StatefulWidget {
  final String title;
  const BackyardListPage({Key key, this.title = "Meus quintais"})
      : super(key: key);

  @override
  _BackyardListPageState createState() => _BackyardListPageState();
}

class _BackyardListPageState extends State<BackyardListPage> {
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
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[300],
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.white,
              child: Container(
                height: 80,
                width: 400,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/dog.jpg",
                              height: 200,
                              width: 80,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 32),
                              child: Text(
                                "Quintal da Pandora",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          highlightColor: Colors.grey[350].withOpacity(0.2),
                          splashColor: Colors.grey[350].withOpacity(0.2),
                          onTap: () {
                            Modular.to.pushNamed("/backyard");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.home),
      ),
    );
  }
}
