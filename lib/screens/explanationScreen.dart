import 'package:firebase_demo_test/screens/situationScreen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';

class ExplanationScreen extends StatefulWidget {
  final int outcome;
  final Situation situation;
  final List<Situation> situations;

  const ExplanationScreen({
    super.key,
    required this.outcome,
    required this.situation,
    required this.situations
  });

  @override
  State<ExplanationScreen> createState() => _ExplanationScreenState();
}

class _ExplanationScreenState extends State<ExplanationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _gadoorFadeAnimation;

  bool _characterVisible = false;
  bool _canNavigate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Aparte fade voor "Ga door.." tekst
    _gadoorFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) _showCharacter();
    });
  }

  void _showCharacter() {
    setState(() => _characterVisible = true);
    _controller.forward();

    // Na 4 seconden mag de gebruiker doorgaan
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() => _canNavigate = true);
      }
    });
  }

  void _navigateNext() {
    if (!_canNavigate) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => SituationScreen(
          situation: widget.situations.firstWhere((s) => s.id == widget.outcome),
          situations: widget.situations,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _navigateNext, // tik overal om door te gaan
        child: Stack(
          children: [
            Image.asset(
              widget.situation.explanationImagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            if (_characterVisible)
              Container(
                color: Colors.black.withValues(alpha: 0.4),
                child: Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 80),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: Offset(2, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                widget.situation.explanation,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/modern_guide.png",
                                  height: 250,
                                  width: 250,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // "Ga door.." tekst rechtsonder, fade-in als _canNavigate true is
            if (_canNavigate)
              Positioned(
                bottom: 32,
                right: 24,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 600),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: const Text(
                    "Ga door..",
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}