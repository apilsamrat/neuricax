import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:neuricax/core/constants/color_constants.dart';
import 'package:neuricax/features/history/views/history_screen.dart';
import 'package:neuricax/features/profile/profile_screen.dart';
import 'package:neuricax/features/uploadimage/upload_image_screen.dart';
import 'package:neuricax/main.dart';
import 'package:neuricax/widgets/app_name.dart';
import 'package:neuricax/widgets/description_text.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        currentIndex: currentIndex,

        onTap: (value) {
          pageController.jumpToPage(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomBarItem(icon: Icon(IconlyBroken.home), title: Text('Home')),
          BottomBarItem(
            icon: Icon(IconlyBroken.document),
            selectedIcon: Icon(IconlyBold.document),
            title: Text('History'),
          ),
          BottomBarItem(
            icon: Icon(IconlyBroken.notification),
            title: Text('Notifications'),
          ),
          BottomBarItem(
            icon: Icon(IconlyBroken.profile),
            title: Text('Profile'),
          ),
        ],
        option: DotBarOptions(
          iconSize: 24,
          dotStyle: DotStyle.tile,
          inkColor: primaryColor,
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appNameWidget(size: 32),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: Icon(IconlyBroken.logout),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(17),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            UploadImageScreen(),
            HistoryScreen(),
            Center(
              child: descriptionText('No notifications yet :):', size: 18),
            ),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
