import 'package:flutter/material.dart';
import 'modeSelectScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with TickerProviderStateMixin {
  int _slide = 0;

  // overlay
  late AnimationController _overlayController;
  late Animation<double> _overlayAnimation;

  // intro text
  late AnimationController _textFadeController;
  late Animation<double> _textFadeAnimation;

  // brain fade
  late AnimationController _brainFadeController;
  late Animation<double> _brainFadeAnimation;

  // brain slides
  late AnimationController _brainMoveController;
  late Animation<Alignment> _brainAlignAnimation;
  late Animation<double> _contentFadeController;

  // slide fade
  late AnimationController _slideFadeController;
  late Animation<double> _slideFadeAnimation;

  //end text
  late AnimationController _endTextController;
  late Animation<double> _endTextFade;

  final List<_BrainSlideData> _brainSlides = [
    _BrainSlideData(
      imagePath: "assets/images/introScreenImages/brain_60.png",
      percentage: "60%",
      label: "Overleven, snel,\nautomatisch",
    ),
    _BrainSlideData(
      imagePath: "assets/images/introScreenImages/brain_35.png",
      percentage: "35%",
      label: "Erbij horen,\nreacties, gevoel",
    ),
    _BrainSlideData(
      imagePath: "assets/images/introScreenImages/brain_5.png",
      percentage: "5%",
      label: "Denken,\nplannen, controle",
    ),
  ];

  int _brainSlideIndex = 0;

  @override
  void initState() {
    super.initState();

    _overlayController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _overlayAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
      CurvedAnimation(parent: _overlayController, curve: Curves.easeIn),
    );

    _textFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _textFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _textFadeController, curve: Curves.easeIn),
    );

    _brainFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _brainFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _brainFadeController, curve: Curves.easeIn),
    );

    _brainMoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _brainAlignAnimation = AlignmentTween(
      begin: const Alignment(0, -0.8), //Height of head of boy in image
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _brainMoveController, curve: Curves.easeOut),
    );

    _contentFadeController = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _brainMoveController, curve: Curves.easeIn),
    );

    _slideFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideFadeAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _slideFadeController, curve: Curves.easeOut),
    );

    _endTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _endTextFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _endTextController, curve: Curves.easeIn),
    );

    Future.delayed(const Duration(milliseconds: 1200), () {
      _textFadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 4000), () async {
      await _overlayController.forward();
      setState(() => _slide = 1);
      await _brainFadeController.forward();
    });
  }

  @override
  void dispose() {
    _overlayController.dispose();
    _textFadeController.dispose();
    _brainFadeController.dispose();
    _brainMoveController.dispose();
    _slideFadeController.dispose();
    super.dispose();
  }

  Future<void> _volgende() async {
    if (_slide == 1) {
      setState(() {
        _slide = 2;
        _brainSlideIndex = 0;
      });
      _brainMoveController.forward();
      return;
    }

    if (_slide == 2) {
      if (_brainSlideIndex < _brainSlides.length - 1) {
        await _slideFadeController.forward();
        setState(() => _brainSlideIndex++);
        _slideFadeController.reverse();
      } else {
        await _slideFadeController.forward();
        setState(() => _slide = 3);
        _slideFadeController.reverse();
        _endTextController.forward();
      }
      return;
    }

    if (_slide == 3) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ModeSelectScreen(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _volgende,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            _buildOverlay(),

            if (_slide == 0) _buildIntroText(),
            if (_slide == 1) _buildBrainIntro(),
            if (_slide == 2) _buildBrainSlides(),
            if (_slide == 3) _buildEndText(),

            if (_slide >= 1 && _slide < 3) _buildHint(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      "assets/images/introScreenImages/slide_breinachtergrond.png",
      fit: BoxFit.cover,
    );
  }

  Widget _buildOverlay() {
    return AnimatedBuilder(
      animation: _overlayAnimation,
      builder: (_, __) {
        return Container(
          color: Colors.black.withOpacity(_overlayAnimation.value),
        );
      },
    );
  }

  Widget _outlinedText(String text, double size) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildIntroText() {
    return FadeTransition(
      opacity: _textFadeAnimation,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: _outlinedText(
            "Denk je dat jij kiest\nwat je doet?",
            30,
          ),
        ),
      ),
    );
  }

  Widget _buildBrainIntro() {
    return FadeTransition(
      opacity: _brainFadeAnimation,
      child: Align(
        alignment: const Alignment(0, -0.8), //Head height of boy in image
        child: Image.asset(
          "assets/images/introScreenImages/brain_base.png",
          width: 220,
        ),
      ),
    );
  }

  Widget _buildBrainSlides() {
    final data = _brainSlides[_brainSlideIndex];

    return FadeTransition(
      opacity: _slideFadeAnimation,
      child: AnimatedBuilder(
        animation: _brainAlignAnimation,
        builder: (_, __) {
          return Stack(
            children: [
              Align(
                alignment: _brainAlignAnimation.value,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(data.imagePath, width: 240),
                      Text(
                        data.percentage,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 0,
                bottom: 0,
                child: FadeTransition(
                  opacity: _contentFadeController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dit deel van het brein\nis verantwoordelijk voor:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.label,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEndText() {
    return FadeTransition(
      opacity: _endTextFade,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: _outlinedText(
            "De meeste keuzes maak je al...\nvoordat je denkt.",
            28,
          ),
        ),
      ),
    );
  }

  Widget _buildHint() {
    return const Positioned(
      bottom: 30,
      right: 24,
      child: Text(
        "Tik om verder te gaan",
        style: TextStyle(color: Colors.white54, fontSize: 13),
      ),
    );
  }
}

class _BrainSlideData {
  final String imagePath;
  final String percentage;
  final String label;

  const _BrainSlideData({
    required this.imagePath,
    required this.percentage,
    required this.label,
  });
}