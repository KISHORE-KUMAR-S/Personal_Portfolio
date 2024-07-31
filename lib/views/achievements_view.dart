import 'package:flutter/material.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/widgets/process_card.dart';
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
          ),
          SizedBox(height: context.isMobile ? 50 : 200),
          const ProcessCard(
            isReversed: false,
            number: "01",
            title: "PALS Campus Student Leader",
            description:
                "I was a Campus Student Leader, representing my college in the PAN IIT Alumni Leadership Series (PALS), an educational initiative supported by IIT Alumni Industry Interaction Centre (IITAC) and IIT Madras Alumni Charitable Trust (IITMACT). I contributed to building campus community, mentoring students, and organizing impactful events.",
          ),
          const ProcessCard(
            isReversed: true,
            number: "02",
            title: "PALS Student Speaker",
            description:
                "As a PALS Student Leader, I had the privilege of representing our team as a Student Speaker at the PALS. We presented a case-study on the ground-breaking concept of  'Industry 5.0 - Predicting the Future' to a large virtual audience.",
          ),
        ],
      ),
    );
  }
}
