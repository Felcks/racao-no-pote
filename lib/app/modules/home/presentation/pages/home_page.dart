import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart'
    as mElement;
import 'package:racao_no_pote/app/modules/home/presentation/pages/about_page.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Quintal"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: 20,
                  child: Observer(
                    builder: (_) {
                      return Text(
                        controller.backyard != null
                            ? controller.backyard.animal.name
                            : "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/dog.jpg", scale: 5),
                ),
              ],
            ),
          ),
          SlidingSheet(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              // Enable snapping. This is true by default.
              snap: true,
              // Set custom snapping points.
              snappings: [0.65, 1.0],
              // Define to what the snappings relate to. In this case,
              // the total available space that the sheet can expand to.
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            // The body widget will be displayed under the SlidingSheet
            // and a parallax effect can be applied to it.
            body: Center(
              child: Text('This widget is below the SlidingSheet'),
            ),
            builder: (context, state) {
              // This is the content of the sheet that will get
              // scrolled, if the content is bigger than the available
              // height of the sheet.
              return Container(
                height: MediaQuery.of(context).size.height,
                child: AboutPage(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getElementWidget(mElement.Element element, String image) {
    if (element == null) {
      return Column(
        children: <Widget>[
          Image.asset(image),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset(image),
          Slider(
            value: element.quantity.toDouble(),
            onChanged: (value) {
              setState(() {
                controller.updateElementQuantity(element, value);
              });
            },
            divisions: 4,
            min: 0,
            max: 100,
          ),
          Text(element.quantity.toString()),
          Text(element.updateDateFormatted),
          Text(element.incrementDateFormatted),
        ],
      );
    }
  }
}

//FUNCIONANDO
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         color: Colors.white,
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Container(
//                 color: Colors.green,
//                 child: Text(
//                   "Pandora",
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Stack(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Image.asset("assets/dog.jpg", scale: 5),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Observer(
//                               builder: (_) {
//                                 return getElementWidget(
//                                     controller.backyard?.food,
//                                     "assets/food_pot.jpg");
//                               },
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Observer(
//                               builder: (_) {
//                                 return getElementWidget(
//                                     controller.backyard?.water,
//                                     "assets/water_pot.jpg");
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SlidingSheet(
//                     elevation: 8,
//                     cornerRadius: 16,
//                     snapSpec: const SnapSpec(
//                       // Enable snapping. This is true by default.
//                       snap: true,
//                       // Set custom snapping points.
//                       snappings: [0.4, 0.7, 1.0],
//                       // Define to what the snappings relate to. In this case,
//                       // the total available space that the sheet can expand to.
//                       positioning: SnapPositioning.relativeToAvailableSpace,
//                     ),
//                     // The body widget will be displayed under the SlidingSheet
//                     // and a parallax effect can be applied to it.
//                     body: Center(
//                       child: Text('This widget is below the SlidingSheet'),
//                     ),
//                     builder: (context, state) {
//                       // This is the content of the sheet that will get
//                       // scrolled, if the content is bigger than the available
//                       // height of the sheet.
//                       return Container(
//                         height: 500,
//                         child: Center(
//                           child: Text('This is the content of the sheet'),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             // RaisedButton(
//             //   color: Colors.blue,
//             //   child: Text(
//             //     "Criar quintal!",
//             //     style: TextStyle(color: Colors.white),
//             //   ),
//             //   onPressed: () {
//             //     controller.createBackyard();
//             //   },
//             // ),
//             // RaisedButton(
//             //   color: Colors.blue,
//             //   child: Text(
//             //     "Atualizar quintal!",
//             //     style: TextStyle(color: Colors.white),
//             //   ),
//             //   onPressed: () {
//             //     controller.updateBackyard();
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
