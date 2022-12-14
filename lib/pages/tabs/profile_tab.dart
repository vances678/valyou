/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/material.dart';
import 'package:valyou/pages/profile_page.dart';

///
class ProfileTab extends StatefulWidget {
  ///
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

///
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
