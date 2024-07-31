import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/section_title.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          const SectionTitle(
            backgroundText: "TRIUMPH",
            foregroundText: "ACHIEVEMENTS",
            subtitle: "LET'S TALK ABOUT MY ACHIEVEMENTS",
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
