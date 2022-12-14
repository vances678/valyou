/* 
The entry point of the application
Author: Vance Spears
Date: 2022/12/13
*/

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

/// The instance of the global app theme used for the entire app
AppTheme currentTheme = AppTheme();

/// The entry point of the application that instantiates the app widget and Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.collection("settings").get().then(
        (QuerySnapshot snapshot) => {
          for (var doc in snapshot.docs)
            {currentTheme.darkModeEnabled = doc.get("enabled")}
        },
      );
  runApp(const App());
}

/// The app widget that contains the entire application
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

/// The state for the main app widget
class _AppState extends State<App> {
  /// The index of the page selected by the bottom navigation bar
  late int _selectedPageIndex;

  /// The root pages shown in the bottom navigation bar
  late List<Widget> _pages;

  /// The controller that manages the bottom navigation bar pages
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });

    _selectedPageIndex = 0;
    _pages = [
      const DashboardTab(),
      const ProfileTab(),
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
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
    );
  }

  /// Handles page switching for the bottom navigation bar
  ///
  /// - Parameters:
  ///   - selectedPageIndex: The index of the page selected by the bottom navigation bar
  void _onBottomNavItemTapped(int selectedPageIndex) {
    setState(() {
      _selectedPageIndex = selectedPageIndex;
      _pageController.jumpToPage(selectedPageIndex);
    });
  }
}
