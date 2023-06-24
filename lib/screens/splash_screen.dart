import 'package:flutter/material.dart';
import 'package:hackman/screens/sign_in.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final int _splashDuration = 5; // Duration of the splash screen in seconds
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    Future.delayed(Duration(seconds: _splashDuration), () {
      setState(() {});
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    });
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() {
    _videoPlayerController =
        VideoPlayerController.asset('asset/splash/splash.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      showControls: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff140423),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Chewie(
            controller: _chewieController,
          ),
        ],
      ),
    );
  }
}
