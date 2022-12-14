/* 

Author: Vance Spears
Date: 2022/12/13
*/

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/setting.dart';
import 'package:valyou/pages/webview.dart';
import 'package:valyou/widgets/cards/settings_cards/account_card.dart';
import 'package:valyou/widgets/cards/settings_cards/settings_card.dart';

///
class ProfilePage extends StatefulWidget {
  ///
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

///
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Defaults.increment * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: GoogleFonts.poppins(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const AccountCard(),
              const SizedBox(height: Defaults.increment * 2),
              SettingsCard(
                title: "SETTINGS",
                settings: [
                  Setting(
                    name: "Account",
                    icon: Icons.account_circle,
                    options: {},
                  ),
                  Setting(
                    name: "Notifications",
                    icon: Icons.notifications,
                    options: {},
                    onTap: () => AppSettings.openNotificationSettings(),
                  ),
                  Setting(
                    name: "Dark mode",
                    icon: Icons.dark_mode_rounded,
                    options: {
                      "enabled":
                          (Theme.of(context).brightness == Brightness.dark)
                    },
                  ),
                ],
              ),
              const SizedBox(height: Defaults.increment * 2),
              SettingsCard(
                title: "ABOUT",
                settings: [
                  Setting(
                    name: "Feedback",
                    icon: Icons.feedback_rounded,
                    options: {},
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => WebViewPage(
                            title: "Feedback",
                            url: "https://forms.gle/iSRSqaD4mKo31D7M7",
                          ),
                        ),
                      );
                    },
                  ),
                  Setting(
                    name: "About",
                    icon: Icons.info,
                    options: {},
                    onTap: () => showAboutDialog(
                      applicationName: "valyou",
                      applicationIcon: const Icon(
                        Icons.view_in_ar_rounded,
                        size: 32,
                      ),
                      applicationLegalese: "hi there!",
                      applicationVersion: "0.0.1",
                      context: context,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
