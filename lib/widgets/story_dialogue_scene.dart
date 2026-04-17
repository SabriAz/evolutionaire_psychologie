import 'package:flutter/material.dart';

class StoryDialogScene extends StatefulWidget {
  final String backgroundImage;
  final String text;

  final String? characterImage;
  final bool showCharacter;

  final String buttonText;
  final VoidCallback onNext;

  const StoryDialogScene({
    super.key,
    required this.backgroundImage,
    required this.text,
    required this.onNext,
    this.characterImage,
    this.showCharacter = true,
    this.buttonText = "Volgende",
  });

  @override
  State<StoryDialogScene> createState() => _StoryDialogSceneState();
}

class _StoryDialogSceneState extends State<StoryDialogScene> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() => _visible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          Image.asset(
            widget.backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          if (_visible)
            Container(
              color: Colors.black.withOpacity(0.35),
            ),

          if (_visible)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 60),

                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (widget.showCharacter &&
                          widget.characterImage != null)
                        Positioned(
                          bottom: 0,
                          child: Image.asset(
                            widget.characterImage!,
                            height: 260,
                          ),
                        ),

                      Positioned(
                        top: 40,
                        left: 24,
                        right: 24,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            widget.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                    ),
                    child: Text(widget.buttonText),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}