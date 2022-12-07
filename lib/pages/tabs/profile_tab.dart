import 'package:flutter/material.dart';
import 'package:valyou/pages/profile_page.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

final GlobalKey<NavigatorState> dashboardNavigatorKey = GlobalKey();

class _ProfileTabState extends State<ProfileTab>
    with AutomaticKeepAliveClientMixin<ProfileTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const ProfilePage();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
