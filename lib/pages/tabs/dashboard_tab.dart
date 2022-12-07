import 'package:flutter/material.dart';
import 'package:valyou/data/value.dart';
import 'package:valyou/pages/dashboard_page.dart';
import 'package:valyou/pages/details_page.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

final GlobalKey<NavigatorState> dashboardNavigatorKey = GlobalKey();

class _DashboardTabState extends State<DashboardTab>
    with AutomaticKeepAliveClientMixin<DashboardTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page = const DashboardPage();
        if (settings.name == "DetailsPage") {
          Value value = settings.arguments as Value;
          page = DetailsPage(value: value);
        }
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
