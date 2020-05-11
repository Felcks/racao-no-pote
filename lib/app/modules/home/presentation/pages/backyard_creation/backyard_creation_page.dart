import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/backyard.dart';
import 'backyard_creation_controller.dart';

class BackyardCreationPage extends StatefulWidget {
  final String title;
  final Backyard backyard;
  const BackyardCreationPage(
      {Key key, this.title = "Criar quintal", this.backyard})
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

    if (widget.backyard != null) {
      controller.setPresentationBackyard(widget.backyard);
    }
  }

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
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
            FocusScope.of(context).requestFocus(FocusNode());
            if (widget.backyard != null)
              Modular.to.pushReplacementNamed("/backyard");
            else
              Modular.to.pop();
          },
        ),
        actions: <Widget>[
          Observer(
            builder: (_) {
              return IconButton(
                onPressed: controller.isValid
                    ? () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller
                            .createOrUpdateBackyard(widget.backyard != null
                                ? widget.backyard.id
                                : null)
                            .then((result) {
                          if (result) if (widget.backyard != null)
                            Modular.to.pushReplacementNamed("/backyard");
                          else
                            Modular.to.pop();
                        });
                      }
                    : () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.showErrors = true;
                      },
                icon: Icon(Icons.done),
              );
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
                        return TextFormField(
                          initialValue: controller.model.backyard.animal.name,
                          textCapitalization: TextCapitalization.words,
                          onChanged: controller.model.changeName,
                          onEditingComplete: () {
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
                    TextFormField(
                      initialValue: controller.model.backyard.animal.nickname,
                      textCapitalization: TextCapitalization.words,
                      onChanged: controller.model.changeNickName,
                      maxLength: 20,
                      maxLines: 1,
                      focusNode: fcnNickName,
                      onEditingComplete: () {
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
                    TextFormField(
                      initialValue: controller.model.backyard.animal.weight !=
                              null
                          ? controller.model.backyard.animal.weight.toString()
                          : "",
                      expands: false,
                      maxLines: 1,
                      onChanged: controller.model.changeWeight,
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
                        showDatePicker(
                          context: context,
                          initialDate: controller.model.backyard.animal.birthday
                                  .toLocal() ??
                              DateTime.now(),
                          firstDate: DateTime(2000, 1, 1),
                          lastDate: DateTime.now(),
                        ).then(
                          (value) {
                            print(value.toIso8601String());
                            controller.confirmDateTime(value);
                            setState(() {});
                          },
                        );
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
                                      Observer(
                                        builder: (_) {
                                          return Text(
                                            controller.model.backyard.animal
                                                        .birthday !=
                                                    null
                                                ? "${controller.model.backyard.animal.birthday.day}/"
                                                    "${controller.model.backyard.animal.birthday.month}/"
                                                    "${controller.model.backyard.animal.birthday.year}"
                                                : "",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          );
                                        },
                                      )
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
                            controller.model.backyard.animal.birthday != null)
                          return Container();

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
                      return TextFormField(
                        initialValue:
                            controller.model.backyard.food.maxQuantity > 0
                                ? controller.model.backyard.food.maxQuantity
                                    .toString()
                                : "",
                        expands: false,
                        maxLines: 1,
                        onChanged: controller.model.changeFoodQuantity,
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
                            value: controller.model.isUsingCup,
                            onChanged: controller.model.changeIsUsingCup,
                          );
                        },
                      )
                    ],
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.model.isUsingCup == false)
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
                          TextFormField(
                            initialValue: controller.model.backyard.cup != null
                                ? controller.model.backyard.cup.capacity
                                    .toString()
                                : "",
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
                            onChanged: controller.model.changeCupQuantity,
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
    return scaffold;
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
