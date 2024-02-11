import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/consts.dart';
import '../../generated/assets.gen.dart';
import '../blocks/settings/settings_cubit.dart';
import '../components/settings/language_picker.dart';
import '../extensions/context.dart';

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
        children: [
          AnimatedBuilder(
            animation: Listenable.merge(
              [
                sizeController,
                rotateController,
                shiftController,
              ],
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
                      style: context.textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    context.strings.welcomeDescription,
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
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
                playIntroSound();
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

    opacityAnimation = Tween<double>(begin: 1, end: 0.3).animate(
      CurvedAnimation(parent: shiftController, curve: Curves.linear),
    );

    shiftController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setUserOnboarded();
        }
      },
    );
  }

  void setUserOnboarded() {
    context.read<SettingsCubit>().setOnboarded(true);
  }

  Future<void> playIntroSound() async {
    AudioCache.instance = AudioCache(prefix: '');
    final player = AudioPlayer();
    await player.play(AssetSource(Assets.audio.intro));
  }
}
