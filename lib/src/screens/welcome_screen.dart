import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../config/consts.dart';
import '../../generated/assets.gen.dart';
import '../components/settings/language_picker.dart';
import '../extensions/context.dart';
import 'landing_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.decorOffset});

  final double decorOffset;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController sizeController;
  late AnimationController rotateController;
  late AnimationController shiftController;
  late Animation<double> sizeAnimation;
  late Animation<double> rotateAnimation;
  late Animation<double> shiftAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    initializeAnimationControllers();
    initializeAnimations();
  }

  @override
  void dispose() {
    sizeController.dispose();
    rotateController.dispose();
    shiftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
            animation: Listenable.merge(
              [sizeController, rotateController, shiftController],
            ),
            child: OverflowBox(
              maxWidth: screenHeight,
              alignment: Alignment.topLeft,
              child: Assets.images.decor.image(
                height: screenHeight,
                alignment: Alignment.topLeft,
                fit: BoxFit.fitHeight,
              ),
            ),
            builder: (context, child) {
              final sizeValue = sizeAnimation.value;
              final rotateValue = rotateAnimation.value;
              final opacityValue = opacityAnimation.value;
              final offsetValue = shiftAnimation.value;
              return Transform.scale(
                scale: sizeValue,
                child: Transform.rotate(
                  angle: rotateValue * (3.14159 / 180),
                  child: Opacity(
                    opacity: opacityValue,
                    child: Transform.translate(
                      offset: Offset(offsetValue, 0),
                      child: child,
                    ),
                  ),
                ),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(pagePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LanguagePicker(),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: paddingLarge),
                    child: Text(
                      context.strings.welcomeHeader,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    context.strings.welcomeDescription,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: FilledButton(
                          onPressed: () => sizeController.forward(),
                          child: Text(context.strings.buttonNext.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initializeAnimationControllers() {
    sizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    shiftController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void initializeAnimations() {
    sizeAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(sizeController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            rotateController.forward();
          }
        },
      );

    rotateAnimation =
        Tween<double>(begin: 0.0, end: 360.0).animate(rotateController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                sizeController.reverse();
                AudioCache.instance = AudioCache(prefix: '');
                final player = AudioPlayer();
                player.play(AssetSource(Assets.audio.intro));
              }
            },
          );

    sizeController.addStatusListener(
      (status) {
        if (status == AnimationStatus.dismissed) {
          shiftController.forward();
        }
      },
    );

    shiftAnimation =
        Tween<double>(begin: 0.0, end: -widget.decorOffset).animate(
      CurvedAnimation(parent: shiftController, curve: Curves.easeOut),
    );

    opacityAnimation = Tween<double>(begin: 0.5, end: 0.3).animate(
      CurvedAnimation(parent: shiftController, curve: Curves.linear),
    );

    shiftController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          navigateToLandingScreen();
        }
      },
    );
  }

  void navigateToLandingScreen() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LandingScreen(decorOffset: widget.decorOffset),
        transitionDuration: Duration.zero,
      ),
    );
  }
}
