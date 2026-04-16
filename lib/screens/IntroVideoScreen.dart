import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/menu_button.dart';
import 'situationScreen.dart';
import '../models/situation.dart';

class IntroVideoScreen extends StatefulWidget {
  final List<Situation> situations;

  const IntroVideoScreen({super.key, required this.situations});

  @override
  State<IntroVideoScreen> createState() => _IntroVideoScreenState();
}

class _IntroVideoScreenState extends State<IntroVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
    VideoPlayerController.asset("assets/videos/video_tijdlijn_oertijd.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.isInitialized &&
          _controller.value.position >= _controller.value.duration &&
          _controller.value.duration != Duration.zero) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                SituationScreen(
                  situation: widget.situations[0],
                  situations: widget.situations,
                ),
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

  void _skip() {
    _controller.pause();
    _controller.dispose();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            SituationScreen(
              situation: widget.situations[0],
              situations: widget.situations,
            ),
      ),
    );
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

          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: MenuButton(
              text: "Skip",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SituationScreen(
                      situation: widget.situations[0],
                      situations: widget.situations,
                    ),
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