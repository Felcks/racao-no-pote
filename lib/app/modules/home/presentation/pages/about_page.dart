import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:racao_no_pote/app/modules/home/presentation/controller/home_controller.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart'
    as mElement;

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends ModularState<AboutPage, HomeController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: TabBar(
            controller: _tabController,
            onTap: (index) {
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            labelStyle: TextStyle(fontWeight: FontWeight.w700),
            indicatorSize: TabBarIndicatorSize.label, //makes it better
            labelColor: Colors.black, //Google's sweet blue
            unselectedLabelColor: Color(0xff5f6368), //niceish grey
            isScrollable: true, //up to your taste
            indicator: MD2Indicator(
              indicatorHeight: 3,
              indicatorColor: Colors.green,
              indicatorSize: MD2IndicatorSize.full,
            ),
            tabs: <Widget>[
              Tab(
                text: "Sobre",
              ),
              Tab(
                text: "Quintal",
              ),
              Tab(
                text: "Ações",
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 300));
        },
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ListView.builder(
                itemCount: controller.backyard.animal.getAttributes().length,
                itemBuilder: (BuildContext context, int index) {
                  String title = controller.backyard.animal
                      .getAttributes()
                      .keys
                      .elementAt(index);
                  String value = controller.backyard.animal
                      .getAttributes()
                      .values
                      .elementAt(index);

                  print(controller.backyard.animal.getAttributes().length);
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

              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [

              //       RaisedButton(
              //     color: Colors.blue,
              //     child: Text(
              //       "Criar quintal!",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     onPressed: () {
              //       controller.createBackyard();
              //     },
              //   ),
              //     Text(
              //       "Nome",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Text("Pandora"),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     Text(
              //       "Idade",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(height: 5),
              //     Text("7 meses"),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     Text(
              //       "Peso",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(height: 5),
              //     Text("8 Kg"),
              //     SizedBox(
              //       height: 10,
              //     ),
              //   ],
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return getElementWidget(
                                  controller.backyard?.food, "Comida");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return getElementWidget(
                                  controller.backyard?.water, "Água");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                        child: Text(
                          "Copo cheio",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.incrementFoodQuantity(10);
                        },
                      ),
                      RaisedButton(
                        color: Colors.green,
                        child: Text(
                          "Meio copo",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.incrementFoodQuantity(10);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getElementWidget(mElement.Element element, String name) {
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
              showValueIndicator: ShowValueIndicator.never,
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.indigoAccent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Slider(
              value: element.quantity.toDouble(),
              onChanged: (value) {
                setState(() {
                  controller.updateElementQuantity(element, value);
                });
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
