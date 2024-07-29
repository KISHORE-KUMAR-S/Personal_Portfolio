import 'package:flutter/material.dart'
    show BuildContext, Paint, PaintingStyle, Theme;

class Constants {
  static const Duration smallDelay = Duration(milliseconds: 1500);
  static const Duration mediumDelay = Duration(milliseconds: 3000);
  static const Duration mediumAnimationSpeed = Duration(milliseconds: 400);

  static const primaryEmail = "livekishore2001@gmail.com";
  static const secondaryEmail = "kk2001kishorekumar@gmail.com";
  static const mobileNumber = "+91 7373 10 2828";
  static const githubProfile = "https://github.com/KISHORE-KUMAR-S";
  static const linkedInProfile =
      "https://www.linkedin.com/in/kishore-kumar-s-8b0683201/";

  static outlinedText(BuildContext context, {double strokeWidth = 1}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Theme.of(context).colorScheme.secondary;
  }
}
