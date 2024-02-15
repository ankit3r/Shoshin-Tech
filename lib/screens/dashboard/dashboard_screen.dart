import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech/controlle/dashboard_controller.dart';
import 'package:shoshin_tech/model/tab_model.dart';
import 'package:shoshin_tech/widgets/widgets_functions.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final DashboardController _controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          WidgetsItem.background(),
          SafeArea(
            child: Column(
              children: [
                WidgetsItem.customeToolbar(
                  title: 'Hey Ankit',
                  onDrawerClick: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 0,
                          child: Container(
                            width: double.infinity,
                            height: 90,
                            padding: const EdgeInsets.only(
                              left: 1,
                              right: 10,
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: _controller.tabs.length,
                              itemBuilder: (context, index) {
                                TabModel model = _controller.tabs[index];
                                return GestureDetector(
                                  onTap: () {
                                    _controller.pageController
                                        .jumpToPage(index);
                                  },
                                  child: WidgetsItem.tabButton(
                                    model,
                                    index: index,
                                    selectedIndex:
                                        _controller.currentPageIndex.value,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: _controller.pageController,
                            itemCount: _controller.tabs.length,
                            onPageChanged: (index) {
                              _controller.currentPageIndex.value = index;
                            },
                            itemBuilder: (context, index) {
                              return _controller.tabs[index].screen;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            _scaffoldKey.currentState?.openDrawer();
          }
        },
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
