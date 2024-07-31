// import 'package:flutter/material.dart';
// import 'package:personal_portfolio/utils/education.dart';
// import 'package:visibility_detector/visibility_detector.dart'
//     show VisibilityDetector, VisibilityInfo;

// import '../extension/screen_size_extension.dart';
// import '../utils/experience.dart';
// import 'experience_step_card.dart';
// import 'mobile_step_card.dart';

// class EducationListViewWidget extends StatefulWidget {
//   const EducationListViewWidget({super.key});

//   @override
//   State<EducationListViewWidget> createState() =>
//       _EducationListViewWidgetState();
// }

// class _EducationListViewWidgetState extends State<EducationListViewWidget>
//     with TickerProviderStateMixin {
//   late AnimationController _controller, _textController;
//   final Duration duration = const Duration(seconds: 1);

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: duration * Experience.ksExperiences.length,
//     );
//     _textController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: const ValueKey('jobs'),
//       onVisibilityChanged: (VisibilityInfo info) {
//         if (info.visibleFraction > 0.2) {
//           _controller.forward();
//         }
//         if (info.visibleFraction < 0.4 && _controller.isCompleted) {
//           _controller.reverse();
//         }
//       },
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: <Widget>[
//             ...Education.ksEducation.map(
//               (e) {
//                 int index = Education.ksEducation.indexOf(e);
//                 double start = index / Education.ksEducation.length;
//                 double end = (index + 1) > Education.ksEducation.length
//                     ? 10
//                     : (index + 1) / Education.ksEducation.length;

//                 return context.getResponsiveValue([
//                   MobileStepCard(
//                     model: e,
//                     animation: _controller,
//                     start: start,
//                     end: end,
//                     index: index + 1,
//                   ),
//                   MobileStepCard(
//                     model: e,
//                     animation: _controller,
//                     start: start,
//                     end: end,
//                     index: index + 1,
//                   ),
//                   ExperienceStepCard(
//                     model: e,
//                     animation: _controller,
//                     start: start,
//                     end: end,
//                     index: index + 1,
//                   ),
//                 ]);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
