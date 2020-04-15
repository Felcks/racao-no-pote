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
  FocusNode fcnName;
  FocusNode fcnNickName;
  FocusNode fcnWeight;
  FocusNode fcnCupQuantity;
  FocusNode fcnFoodQuantity;

  @override
  void initState() {
    super.initState();

    fcnName = FocusNode();
    fcnNickName = FocusNode();
    fcnWeight = FocusNode();
    fcnCupQuantity = FocusNode();
    fcnFoodQuantity = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        actions: <Widget>[
          Observer(
            builder: (_) {
              return IconButton(
                  onPressed: controller.isValid
                      ? () async {
                          final result = await controller.creatingBackyard();
                          if (result) Modular.to.pop();
                        }
                      : () {
                          controller.showErrors = true;
                        },
                  icon: Icon(Icons.done));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 500,
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
                      "Pet",
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
                    Observer(
                      builder: (_) {
                        return TextField(
                          textCapitalization: TextCapitalization.words,
                          onChanged: controller.backyard.changeName,
                          onSubmitted: (value) {
                            fcnNickName.requestFocus();
                          },
                          maxLength: 20,
                          maxLines: 1,
                          focusNode: fcnName,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              errorText: controller.showErrors == true
                                  ? controller.validateName()
                                  : null),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
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
                      textCapitalization: TextCapitalization.words,
                      onChanged: controller.backyard.changeNickName,
                      maxLength: 20,
                      maxLines: 1,
                      focusNode: fcnNickName,
                      onSubmitted: (value) {
                        fcnWeight.requestFocus();
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text(
                      "Peso (em quilos)",
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
                      focusNode: fcnWeight,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        DecimalTextInputFormatter(
                            activatedNegativeValues: false, decimalRange: 2),
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
                        fcnName.unfocus();
                        fcnNickName.unfocus();
                        fcnWeight.unfocus();
                        fcnCupQuantity.unfocus();
                        fcnFoodQuantity.unfocus();
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
                    Observer(
                      builder: (_) {
                        if (controller.showErrors == false ||
                            controller.birthday != null) return Container();

                        return Padding(
                          padding: EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            controller.validateBirthday(),
                            style:
                                TextStyle(fontSize: 12, color: Colors.red[700]),
                          ),
                        );
                      },
                    )
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
                    "Alimentação",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Quantidade de comida diária (em gramas)",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        expands: false,
                        maxLines: 1,
                        onChanged: controller.backyard.changeFoodQuantity,
                        focusNode: fcnFoodQuantity,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          DecimalTextInputFormatter(
                              activatedNegativeValues: false, decimalRange: 2),
                        ],
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            errorText: controller.showErrors == true
                                ? controller.validateFoodQuantity()
                                : null),
                      );
                    },
                  ),
                ],
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
                      Observer(
                        builder: (context) {
                          return Switch(
                            value: controller.backyard.isUsingCup,
                            onChanged: controller.backyard.changeIsUsingCup,
                          );
                        },
                      )
                    ],
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.backyard.isUsingCup == false)
                        return Container();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Quanta ração cabe no copo? (em gramas)",
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
                            focusNode: fcnCupQuantity,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              DecimalTextInputFormatter(
                                  activatedNegativeValues: false,
                                  decimalRange: 2),
                            ],
                            onChanged: controller.backyard.changeCupQuantity,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(),
                                errorText: controller.showErrors == true
                                    ? controller.validateCup()
                                    : null),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
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
