import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/view/furniture_tab.dart';
import 'package:furniture_app/view/product_screen.dart';
import 'package:furniture_app/view/widgets/custom_text.dart';
import 'package:furniture_app/view/widgets/custom_textfields.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/view/widgets/product_component.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  bool showBtn = false;

  static List<Tab> categories = <Tab>[
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("All"),
        ),
      ),
    ),
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("Sofas"),
        ),
      ),
    ),
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("Chairs"),
        ),
      ),
    ),
    Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text("Tables"),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    _searchController;
    _scrollController.addListener(() {
      double showOffset = 10.0;
      if (_scrollController.offset > showOffset) {
        showBtn = true;
        setState(() {
          //update state
        });
      } else {
        showBtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  void dispose() {
    super.dispose();
    _searchController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.btnPrimColor,
      body: SafeArea(
        child: DefaultTabController(
          length: categories.length,
          child: NestedScrollView(
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: false,
                  pinned: false,
                  elevation: 0,
                  backgroundColor: Constants.secondaryColor,
                  expandedHeight: 275,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SearchField(
                                  hint: 'Search',
                                  prefixIcon: Icon(
                                    EvaIcons.search,
                                    color: Constants.secondaryColor,
                                    size: 18,
                                  ),
                                  suffixIcon: SizedBox(),
                                  errorText: '',
                                  controller: _searchController),
                              const SizedBox(
                                width: 6,
                              ),
                              Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Container(
                                      height: 35,
                                      width: 35,
                                      child: const Icon(
                                        EvaIcons.options2Outline,
                                        size: 15,
                                      ))),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    centerTitle: false,
                    titlePadding: EdgeInsets.fromLTRB(15, 5, 20, 5),
                    background: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      indicatorWeight: 0,
                      labelPadding: EdgeInsets.all(5.0),
                      indicatorPadding: EdgeInsets.all(5.0),
                      unselectedLabelColor: Constants.secondaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Constants.btnPrimColor,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Constants.secondaryColor,
                      ),
                      tabs: categories,
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                FurnitureTab(furnitureType: 'All'),
                FurnitureTab(furnitureType: 'Sofas'),
                FurnitureTab(furnitureType: 'Chairs'),
                FurnitureTab(furnitureType: 'Tables'),
              ],
            ),
            controller: _scrollController,
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 1000), //show/hide animation
        opacity: showBtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
                //go to top of scroll
                0, //scroll offset to go
                duration: Duration(milliseconds: 500), //duration of scroll
                curve: Curves.fastOutSlowIn //scroll type
                );
          },
          child: Icon(EvaIcons.arrowUpwardOutline),
          backgroundColor: Constants.secondaryColor,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
