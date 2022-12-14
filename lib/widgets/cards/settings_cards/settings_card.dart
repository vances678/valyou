import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valyou/data/defaults.dart';
import 'package:valyou/data/setting.dart';
import 'package:valyou/main.dart';
import 'package:valyou/widgets/cards/custom_card.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.settings,
  });

  final String title;
  final List<Setting> settings;

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Defaults.increment),
          child: Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CustomCard(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              for (Setting setting in widget.settings)
                Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (setting.onTap != null) {
                          setting.onTap!();
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            setting.icon,
                            size: 32,
                          ),
                          const SizedBox(width: Defaults.increment * 2),
                          Column(
                            children: [
                              Text(
                                setting.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(width: Defaults.increment),
                          ),
                          if (setting.options.isEmpty && setting.onTap != null)
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 24,
                            ),
                          if (setting.options.values.length == 1)
                            Switch(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: setting.options.values.first,
                              onChanged: (value) {
                                setState(() {
                                  setting.options.update(
                                    setting.options.keys.first,
                                    (value) => !value,
                                  );
                                  currentTheme.switchTheme();
                                });
                              },
                            ),
                        ],
                      ),
                    ),
                    (setting == widget.settings.last)
                        ? Container()
                        : Column(
                            children: const [
                              SizedBox(height: Defaults.increment),
                              Divider(thickness: 1),
                              SizedBox(height: Defaults.increment),
                            ],
                          ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
