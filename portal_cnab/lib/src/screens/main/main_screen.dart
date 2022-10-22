import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portal_cnab/src/screens/main/stores/main_store.dart';
import 'package:portal_cnab/src/screens/main/widgets/menu_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainStore mainStore = MainStore();

  @override
  void initState() {
    super.initState();
    mainStore.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('ByCoders Cnab'),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          return SizedBox(
            width: width,
            height: height,
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 8)
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      MenuIcon(
                          icon: Icons.list,
                          backColor: mainStore.index == 0
                              ? Colors.black.withOpacity(0.3)
                              : Colors.transparent,
                          onTap: () {
                            mainStore.setIndex(0);
                          }),
                      MenuIcon(
                          icon: Icons.settings,
                          backColor: mainStore.index == 1
                              ? Colors.black.withOpacity(0.3)
                              : Colors.transparent,
                          onTap: () {
                            mainStore.setIndex(1);
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: width - 80,
                  height: height,
                  child: mainStore.pages[mainStore.index],
                )
              ],
            ),
          );
        }));
  }
}
