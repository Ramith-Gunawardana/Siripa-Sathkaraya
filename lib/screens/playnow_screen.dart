import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siripa_sathkaraya/constants/colors.dart';
import 'package:siripa_sathkaraya/models/playlist_provider.dart';

class PlayNowScreen extends StatefulWidget {
  const PlayNowScreen({super.key});

  @override
  State<PlayNowScreen> createState() => _PlayNowScreenState();
}

class _PlayNowScreenState extends State<PlayNowScreen> {
  @override
  Widget build(BuildContext context) {
    //screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String formatTime(Duration duration) {
      List<String> timeDuration = duration.toString().split(':');
      // String twoDigitSeconds = duration.inSeconds.remainder(60).toString();
      String hours = timeDuration[0];
      String minutes = timeDuration[1];
      List<String> secondsWithMills = timeDuration[2].split('.');
      String seconds = secondsWithMills[0];

      String time =
          hours == '0' ? '$minutes:$seconds' : '$hours:$minutes:$seconds';
      return time;
    }

    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
        final playlist = value.playlist;

        //get current song
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //UI
        return Scaffold(
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? kLightBlue
                  : kDarkBlue1,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? const LinearGradient(
                          colors: [
                            kLightBlue,
                            kLightGreen,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        )
                      : const LinearGradient(
                          colors: [
                            kDarkBlue1,
                            kDarkGreen1,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                height: screenHeight * 0.9,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //album art
                    Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Container(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          height: screenWidth * 0.6,
                          width: screenWidth * 0.6,
                          child: Image.asset(currentSong.albumArtPath),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    //song name
                    Text(
                      currentSong.songName,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    //song duration
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          SliderTheme(
                            data: const SliderThemeData(
                              trackShape: CustomSliderTrackShape(),
                            ),
                            child: Slider(
                              min: 0,
                              max: value.totalDuration.inSeconds.toDouble(),
                              value: value.currentDuration.inSeconds.toDouble(),
                              onChanged: (durationValue) {
                                value.seek(
                                    Duration(seconds: durationValue.toInt()));
                              },
                              onChangeEnd: (durationValue) {
                                value.seek(
                                    Duration(seconds: durationValue.toInt()));
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //start time
                              Text(formatTime(value.currentDuration)),

                              //end time
                              Text(formatTime(value.totalDuration)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),

                    //playback controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //shuffle
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.shuffle_rounded,
                        //   ),
                        // ),

                        //skip previous
                        IconButton(
                          onPressed: value.playPreviousSong,
                          iconSize: 40,
                          icon: const Icon(
                            Icons.skip_previous_rounded,
                          ),
                        ),

                        //play pause
                        IconButton(
                          onPressed: value.pauseOrResume,
                          iconSize: 80,
                          icon: Icon(
                            value.isPlaying
                                ? Icons.pause_circle_filled_rounded
                                : Icons.play_circle_filled_rounded,
                          ),
                        ),

                        //skip next
                        IconButton(
                          onPressed: value.playNextSong,
                          iconSize: 40,
                          icon: const Icon(
                            Icons.skip_next_rounded,
                          ),
                        ),

                        //repeat
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.repeat_rounded,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
