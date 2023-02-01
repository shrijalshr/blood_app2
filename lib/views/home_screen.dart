import 'package:blood_app/views/chat_list_sceen.dart';
import 'package:blood_app/views/request_form.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/export.dart';
import '../utils/widgets/bottom_nav_bar.dart';
import '../utils/widgets/my_drawer.dart';
import 'curated_requests.dart';
import 'search_blood.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  int _selectedTab = 0;
  List<Widget> homescreenTabs = [
    const CuratedRequests(),
    const SearchBlood(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: AppColor.lightGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      drawer: const MyDrawer(),
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        appBar: AppBar(
          title: const Text("Blood Donation App"),
          titleTextStyle: AppStyle.headingStyle(color: AppColor.darkPrimary),
          backgroundColor: AppColor.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    color: AppColor.darkPrimary,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatListScreen()));
                },
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: AppColor.darkPrimary,
                ))
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          onChange: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => RequestForm());
          },
          backgroundColor: AppColor.darkPrimary,
          label: const Text("Request"),
          icon: const Icon(
            Icons.add,
          ),
          isExtended: true,
        ),
        body: homescreenTabs.elementAt(_selectedTab),
      ),
    );
  }
}
