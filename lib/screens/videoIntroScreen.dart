import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'situationScreen.dart';
import '../models/situations.dart';

class VideoIntroScreen extends StatefulWidget {
  final Widget nextScreen;

  const VideoIntroScreen({super.key, required this.nextScreen});

  @override
  State<VideoIntroScreen> createState() => _VideoIntroScreenState();
}

class _VideoIntroScreenState extends State<VideoIntroScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/intro_prehistoric.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    // Ga automatisch naar het volgende scherm als de video klaar is
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => widget.nextScreen),
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
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(color: Color(0xFF99783C)),
      ),
    );
  }
}