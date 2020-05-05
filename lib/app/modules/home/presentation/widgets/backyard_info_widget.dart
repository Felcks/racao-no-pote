import 'package:flutter/material.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/backyard.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart'
    as mElement;

class BackyardInfoWidget extends StatelessWidget {
  final Backyard backyard;
  int count = 0;

  BackyardInfoWidget(this.backyard);

  @override
  Widget build(BuildContext context) {
    count++;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                getElementWidget(context, backyard?.food, "Ração"),
                SizedBox(
                  height: 10,
                ),
                // getElementWidget(context, backyard?.water, "Água"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getElementWidget(
      BuildContext context, mElement.Element element, String name) {

    double sliderValue = element.quantity < element.maxQuantity
        ? element.quantity.toDouble()
        : element.maxQuantity.toDouble();
      
    if (element == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.teal,
                inactiveTrackColor: Colors.teal[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                thumbColor: Colors.teal,
                overlayColor: Colors.indigo.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.teal,
                inactiveTickMarkColor: Colors.teal[100],
                showValueIndicator: ShowValueIndicator.always,
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.tealAccent,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              child: Slider(
                value: sliderValue,
                onChanged: (value) {
                  // setState(() {
                  //   sliderValue = 10
                  // });
                },
                divisions: 1,
                min: 0.0,
                max: element.maxQuantity.toDouble(),
              ),
            ),
          ),
          Text(
            element.getQuantityText(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }
}
