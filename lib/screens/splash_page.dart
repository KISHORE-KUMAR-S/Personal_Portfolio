import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:personal_portfolio/animations/circular_reveal_animation.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/providers/state_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _gradientController;
  late final AnimationController _textController;
  late final Animation<double> _gradientAnimation;

  @override
  void initState() {
    super.initState();
    const lowerBound = 0.0;
    const upperBound = 1.0;
    const gradientDuration = Duration(seconds: 3);
    const textDuration = Duration(milliseconds: 1200);

    _gradientController = AnimationController(
      vsync: this,
      duration: gradientDuration,
      lowerBound: lowerBound,
      upperBound: upperBound,
    );

    _textController = AnimationController(
      vsync: this,
      duration: textDuration,
      lowerBound: lowerBound,
      upperBound: upperBound,
    );

    _gradientAnimation =
        Tween<double>(begin: lowerBound, end: upperBound).animate(
      CurvedAnimation(
        parent: _gradientController,
        curve: const Cubic(.14, .59, .84, -0.31),
      ),
    );

    _textController.forward();
    _gradientController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      context.read<StateProvider>().setNavAnimationStstus(true);
    });
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: Theme.of(context).colorScheme.secondary,
        duration: const Duration(milliseconds: 250),
        child: CircularRevealAnimation(
          animation: _gradientAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder<double>(
                  valueListenable: _textController,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Text.rich(
                        TextSpan(
                          text: "KK",
                          style: GoogleFonts.alegreya(
                            fontSize: context.isMobile ? 50 : 80,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                          children: [
                            TextSpan(
                              text: ".",
                              style: GoogleFonts.alegreya(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
