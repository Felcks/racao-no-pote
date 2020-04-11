import 'package:flutter/material.dart';

import '../../domain/entities/animal.dart';

class AnimalInfoWidget extends StatelessWidget {
  final Animal animal;

  AnimalInfoWidget(this.animal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView.builder(
          itemCount: animal.getAttributes().length,
          itemBuilder: (BuildContext context, int index) {
            String title = animal.getAttributes().keys.elementAt(index);
            String value = animal.getAttributes().values.elementAt(index);

            print(animal.getAttributes().length);
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
