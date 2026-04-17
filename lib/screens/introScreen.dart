import 'package:flutter/material.dart';
import 'modeSelectScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with TickerProviderStateMixin {
  int _slide = 0;

  // Slide 1: overlay opacity (wordt donkerder)
  late AnimationController _overlayController;
  late Animation<double> _overlayAnimation;

  // Slide 2: brein fade in
  late AnimationController _brainFadeController;
  late Animation<double> _brainFadeAnimation;

  // Slide 3-5: brein positie + tekst fade
  late AnimationController _brainMoveController;
  late Animation<Alignment> _brainAlignAnimation;
  late Animation<double> _contentFadeController;

  // fade tussen slides
  late AnimationController _slideFadeController;
  late Animation<double> _slideFadeAnimation;

  // Huidige brein data voor brein slides
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
      duration: const Duration(milliseconds: 1200),
    );
    _overlayAnimation = Tween<double>(begin: 0.2, end: 0.65).animate(
      CurvedAnimation(parent: _overlayController, curve: Curves.easeIn),
    );

    _brainFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _brainFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _brainFadeController, curve: Curves.easeIn),
    );

    _brainMoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _brainAlignAnimation = AlignmentTween(
      begin: Alignment.center,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _brainMoveController, curve: Curves.easeOut));
    _contentFadeController = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _brainMoveController, curve: Curves.easeIn),
    );

    _slideFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _slideFadeController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _overlayController.dispose();
    _brainFadeController.dispose();
    _brainMoveController.dispose();
    _slideFadeController.dispose();
    super.dispose();
  }

  Future<void> _volgende() async {
    if (_slide == 0) {
      // Donkerder maken, dan brein fade in
      await _overlayController.forward();
      setState(() => _slide = 1);
      await _brainFadeController.forward();
      return;
    }

    if (_slide == 1) {
      // Brein beweegt naar rechts, eerste brain slide content
      setState(() {
        _slide = 2;
        _brainSlideIndex = 0;
      });
      _brainMoveController.forward();
      return;
    }

    if (_slide == 2) {
      // Doorlopen door brain slides 0 → 1 → 2, daarna slide 3
      if (_brainSlideIndex < _brainSlides.length - 1) {
        // Fade out huidige content
        await _slideFadeController.forward();
        setState(() => _brainSlideIndex++);
        _slideFadeController.reverse();
      } else {
        // Klaar met brain slides
        await _slideFadeController.forward();
        setState(() => _slide = 3);
        _slideFadeController.reverse();
      }
      return;
    }

    if (_slide == 3) {
      // Naar moduskeuze
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
            _buildAchtergrond(),
            if (_slide >= 0) _buildOverlay(),
            if (_slide == 1) _buildBrainFadeIn(),
            if (_slide == 2) _buildBrainSlides(),
            if (_slide == 3) _buildSlotTekst(),
            if (_slide < 3) _buildTikHint(),
          ],
        ),
      ),
    );
  }

  Widget _buildAchtergrond() {
    String imagePath;
    if (_slide <= 1) {
      imagePath = _slide == 0
          ? "assets/images/introScreenImages/slide1_vraag.png"
          : "assets/images/introScreenImages/slide2_brein.png";
    } else if (_slide == 2) {
      imagePath = "assets/images/introScreenImages/slide_breinachtergrond.png";
    } else {
      imagePath = "assets/images/introScreenImages/slide6_keuze.png";
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildOverlay() {
    return AnimatedBuilder(
      animation: _overlayAnimation,
      builder: (_, __) => Container(
        color: Colors.black.withOpacity(
          _slide == 0 ? _overlayAnimation.value : 0.55,
        ),
      ),
    );
  }

  Widget _buildBrainFadeIn() {
    return FadeTransition(
      opacity: _brainFadeAnimation,
      child: Center(
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
      opacity: _slideFadeAnimation.drive(
        Tween<double>(begin: 1.0, end: 0.0),
      ),
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
                          shadows: [Shadow(blurRadius: 6, color: Colors.black)],
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
                          shadows: const [Shadow(blurRadius: 4, color: Colors.black)],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.label,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 6, color: Colors.black)],
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

  Widget _buildSlotTekst() {
    return FadeTransition(
      opacity: ReverseAnimation(_slideFadeAnimation),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            "De meeste keuzes maak je al...\nvoordat je denkt.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 8, color: Colors.black)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTikHint() {
    return const Positioned(
      bottom: 30,
      right: 24,
      child: Text(
        "Tik om verder te gaan",
        style: TextStyle(
          color: Colors.white54,
          fontSize: 13,
        ),
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