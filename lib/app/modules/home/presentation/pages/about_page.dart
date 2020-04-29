import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

import '../controller/home_controller.dart';
import '../widgets/action_info_widget.dart';
import '../widgets/animal_info_widget.dart';
import '../widgets/backyard_info_widget.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends ModularState<AboutPage, HomeController>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    controller.fetchBackyard();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
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
            isScrollable: false,
            indicator: MD2Indicator(
              indicatorHeight: 3,
              indicatorColor: Theme.of(context).accentColor,
              indicatorSize: MD2IndicatorSize.full,
            ),
            tabs: <Widget>[
              Tab(
                text: "Sobre",
              ),
              Tab(
                text: "Hoje",
              ),
              Tab(
                text: "Ações",
              ),
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (controller.backyard == null)
      return Stack(
        children: <Widget>[
          Positioned(
              top: 150, left: 400 / 2 - 25, child: CircularProgressIndicator())
        ],
      );

    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        _tabController.animateTo(index, duration: Duration(milliseconds: 300));
      },
      children: [
        AnimalInfoWidget(controller.backyard.animal
            .getAttributes(controller.currentDate, controller.currentLocation)),
        BackyardInfoWidget(controller.backyard),
        ActionInfoWidget(controller)
      ],
    );
  }
}
