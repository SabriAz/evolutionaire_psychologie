import 'package:firebase_demo_test/screens/situationScreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/situations.dart';
import '../widgets/menuButton.dart';
import 'tutorialScreen.dart';
import '../models/situation.dart';

class IntroVideoScreen extends StatefulWidget {
  final List<Situation> situations;

  const IntroVideoScreen({super.key, required this.situations});

  @override
  State<IntroVideoScreen> createState() => _IntroVideoScreenState();
}

class _IntroVideoScreenState extends State<IntroVideoScreen> {
  late VideoPlayerController _controller;
  bool _navigated = false;

  String get _videoPath {
    return widget.situations == modern_situations
        ? "assets/videos/video_tijdlijn_modern.mp4"
        : "assets/videos/video_tijdlijn_oertijd.mp4";
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(_videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (_navigated) return;
      if (_controller.value.isInitialized &&
          _controller.value.position >= _controller.value.duration &&
          _controller.value.duration != Duration.zero) {
        _navigated = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => TutorialScreen(situations: widget.situations),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),

          Positioned(
            bottom: 40,
            right: 20,
            child: MenuButton(
              text: "Skip",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TutorialScreen(situations: widget.situations),
                  ),
                );
              },
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}