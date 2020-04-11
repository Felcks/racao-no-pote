import 'package:flutter/material.dart';
import 'package:racao_no_pote/app/modules/home/presentation/controller/home_controller.dart';

class ActionInfoWidget extends StatelessWidget {
  final HomeController controller;

  ActionInfoWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Colocar ração por grama",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "50g",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.incrementFoodQuantity(10);
                  },
                ),
                Spacer(),
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "100g",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
                Spacer(),
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "135g",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Colocar ração por copo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: Column(children: [
                    Text(
                      "Copo cheio",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "(${controller.backyard.cup.getCapacityText()})",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                  onPressed: () {
                    controller.incrementFoodQuantity(10);
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: Column(children: [
                    Text(
                      "Meio copo",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "(${controller.backyard.cup.getHalfCapacityText()})",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                  onPressed: () {
                    controller.incrementFoodQuantity(10);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}