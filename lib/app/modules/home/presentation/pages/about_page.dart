import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:racao_no_pote/app/modules/home/domain/entities/element.dart'
    as mElement;
import 'package:racao_no_pote/app/modules/home/presentation/widgets/action_info_widget.dart';
import 'package:racao_no_pote/app/modules/home/presentation/widgets/animal_info_widget.dart';
import 'package:racao_no_pote/app/modules/home/presentation/widgets/backyard_info_widget.dart';

import '../controller/home_controller.dart';

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
      body: getBody(),
    );
  }

  Widget getBody() {
    if (controller.backyard == null)
      return Center(
        child: CircularProgressIndicator(),
      );

    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        _tabController.animateTo(index, duration: Duration(milliseconds: 300));
      },
      children: [
        AnimalInfoWidget(controller.backyard.animal),
        BackyardInfoWidget(controller.backyard),
        ActionInfoWidget(controller)
      ],
    );
  }
}
