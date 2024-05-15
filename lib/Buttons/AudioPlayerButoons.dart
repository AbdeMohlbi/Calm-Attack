import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerButtons extends StatefulWidget {
  const AudioPlayerButtons({super.key});

  @override
  State<AudioPlayerButtons> createState() => _AudioPlayerButtonsState();
}

class _AudioPlayerButtonsState extends State<AudioPlayerButtons> {
 final player = AudioPlayer();
  List<String> sounds = [

    'music-1.mp3', //sea Waves            Done✔
    'music-2.mp3', //Rainfall             Done✔
    'music-3.mp3', //Birds Chirping
    'music-4.mp3', //Forest Sounds
    'music-5.mp3', //Waterfall
    'music-6.mp3', //Fireplace

  ]; 
  int currentIndex = 0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffEBF4FD),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.skip_previous,
                    size: 40,
                    color:  Color(0xff0F073E),
                  ),
                  onPressed: () {
                    playPreviousSound();
                  },
                ),
              ),
              
              const SizedBox(width: 35),
              Container(
                width: 60,
                height: 60,
                 decoration: BoxDecoration(
                  color: const Color(0xff0F073E),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                    color: const Color(0xffEBF4FD),
                  ),
                  onPressed: () {
                    if (isPlaying) {
                      player.pause();
                    } else {
                      playSound();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
              ),
              const SizedBox(width: 35),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffEBF4FD),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0.1,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.skip_next,
                    size: 40,
                    color: Color(0xff0F073E),
                  ),
                  onPressed: () {
                    playNextSound();
                  },
                ),
              ),
            ],
          ),
        );
  }

  Future<void> playSound() async {
    await player.play(AssetSource(sounds[currentIndex]));
  }

  Future<void> playNextSound() async {
    currentIndex = (currentIndex + 1) % sounds.length;
    await playSound();
  }

  Future<void> playPreviousSound() async {
    currentIndex = (currentIndex - 1 + sounds.length) % sounds.length;
    await playSound();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
