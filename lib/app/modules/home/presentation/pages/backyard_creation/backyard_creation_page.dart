import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'backyard_creation_controller.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 475,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[300],
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Animal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nome",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onChanged: controller.backyard.changeName,
                      maxLength: 10,
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text(
                      "Apelido",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onChanged: controller.backyard.changeNickName,
                      maxLength: 10,
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text(
                      "Peso (em gramas)",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      expands: false,
                      maxLines: 1,
                      onChanged: controller.backyard.changeWeight,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        DecimalTextInputFormatter(
                            activatedNegativeValues: false, decimalRange: 1),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Data de Nascimento",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 2.0,
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          controller.confirmDateTime(date);
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Colors.teal,
                                      ),
                                      Text(
                                        controller.backyard.birthday ?? "",
                                        // " $_date",
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Alterar",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Copo",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Usa copo para colocar ração?",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Switch(
                        value: false,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  Text(
                    "Quantidade de ração no copo em gramas",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    expands: false,
                    maxLines: 1,
                    onChanged: controller.backyard.changeCupQuantity,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return Center(
                  child: RaisedButton(
                    onPressed: controller.isValid ? controller.creatingBackyard : null,
                    color: Colors.blue,
                    child: Text(
                      "Criar quintal",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text("Criar"),
      //   onPressed: () {},
      // ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({int decimalRange, bool activatedNegativeValues})
      : assert(decimalRange == null || decimalRange >= 0,
            'DecimalTextInputFormatter declaretion error') {
    String dp = (decimalRange != null && decimalRange > 0)
        ? "([.][0-9]{0,$decimalRange}){0,1}"
        : "";
    String num = "[0-9]*$dp";

    if (activatedNegativeValues) {
      _exp = new RegExp("^((((-){0,1})|((-){0,1}[0-9]$num))){0,1}\$");
    } else {
      _exp = new RegExp("^($num){0,1}\$");
    }
  }

  RegExp _exp;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_exp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
