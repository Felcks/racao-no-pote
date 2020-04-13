import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart'
    as mElement;

class BackyardInfoWidget extends StatelessWidget {
  final Backyard backyard;

  BackyardInfoWidget(this.backyard);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  getElementWidget(context, backyard?.food, "Comida"),
                  SizedBox(
                    height: 10,
                  ),
                  getElementWidget(context, backyard?.water, "Água"),
                ]),
          ),
        ],
      ),
    );
  }

  Widget getElementWidget(
      BuildContext context, mElement.Element element, String name) {
    if (element == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(name),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.indigo[700],
              inactiveTrackColor: Colors.indigo[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 4.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
              thumbColor: Colors.indigoAccent,
              overlayColor: Colors.indigo.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.indigo[700],
              inactiveTickMarkColor: Colors.indigo[100],
              showValueIndicator: ShowValueIndicator.always,
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.indigoAccent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            child: Slider(
              value: element.quantity.toDouble(),
              onChanged: (value) {
                // setState(() {
                //   controller.updateElementQuantity(element, value);
                // });
              },
              divisions: 4,
              min: 0,
              max: 165,
            ),
          ),
        ],
      );
    }
  }
}
