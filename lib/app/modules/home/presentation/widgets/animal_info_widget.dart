import 'package:flutter/material.dart';

class AnimalInfoWidget extends StatelessWidget {
  final Map<String, String> animalAttributes;

  AnimalInfoWidget(this.animalAttributes);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView.builder(
          itemCount: animalAttributes.length,
          itemBuilder: (BuildContext context, int index) {
            String title = animalAttributes.keys.elementAt(index);
            String value = animalAttributes.values.elementAt(index);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(value),
                SizedBox(
                  height: 15,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
