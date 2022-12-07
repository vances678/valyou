// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valyou/themes/app_theme.dart';
import 'package:valyou/themes/dark_theme.dart';
import 'package:valyou/themes/light_theme.dart';
import 'widgets/navigation/custom_bottom_nav_bar.dart';
import 'pages/tabs/profile_tab.dart';
import 'pages/tabs/dashboard_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
AppTheme currentTheme = AppTheme();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.collection("settings").get().then(
        (QuerySnapshot snapshot) => {
          snapshot.docs.forEach(
            (element) {
              currentTheme.darkModeEnabled = element.get("enabled");
            },
          ),
        },
      );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late int _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });

    _selectedPageIndex = 0;
    _pages = [
      DashboardTab(),
      ProfileTab(),
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: currentTheme.currentTheme(),
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedPageIndex,
          onTap: _onBottomNavItemTapped,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
    );
  }

  void _onBottomNavItemTapped(int selectedPageIndex) {
    setState(() {
      _selectedPageIndex = selectedPageIndex;
      _pageController.jumpToPage(selectedPageIndex);
    });
  }
}
