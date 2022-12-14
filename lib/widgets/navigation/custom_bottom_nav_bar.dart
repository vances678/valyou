/* 
The bottom navigation bar (customized!)
Author: Vance Spears
Date: 2022/12/13
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/pages/checkin_page.dart';
import 'package:valyou/widgets/controls/buttons/primary_button.dart';

/// The customized bottom navigation bar
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  /// The currently selected bottom navigation bar index
  final int currentIndex;

  /// A function that is run when a tab is selected in the bottom navigation bar
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BottomNavigationBar(
          elevation: 16,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_rounded,
                size: 32,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: "Profile",
            ),
          ],
          currentIndex: currentIndex,
          onTap: onTap,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: PrimaryButton(
            padding: const EdgeInsets.all(Defaults.increment) * 3 / 2,
            onPressed: () => showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return const CheckinPage();
              },
            ),
            child: const Icon(
              Icons.paste_rounded,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }
}
