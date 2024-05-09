import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siripa_sathkaraya/models/playlist_provider.dart';
import 'package:siripa_sathkaraya/models/song.dart';
import 'package:siripa_sathkaraya/screens/playnow_screen.dart';

class KaviScreen extends StatefulWidget {
  const KaviScreen({super.key});

  @override
  State<KaviScreen> createState() => _KaviScreenState();
}

class _KaviScreenState extends State<KaviScreen> {
  //get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    showModalBottomSheet(
      context: context,
      enableDrag: true,
      clipBehavior: Clip.antiAlias,
      isDismissible: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return const PlayNowScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      // get playlist
      List<Song> playlist = value.playlist;

      //get current song
      final currentSong = playlist[value.currentSongIndex ?? 0];

      // list UI
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              //get individual song
              final Song song = playlist[index];

              return ListTile(
                title: Text(song.songName),
                leading: const Icon(Icons.music_note_outlined),
                onTap: () => goToSong(index),
              );
            },
          ),
          //player card
          Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.music_note_outlined),
                      title: Text(currentSong.songName),
                      trailing: IconButton(
                        onPressed: value.pauseOrResume,
                        icon: Icon(value.isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          enableDrag: true,
                          clipBehavior: Clip.antiAlias,
                          isDismissible: true,
                          isScrollControlled: true,
                          useSafeArea: true,
                          builder: (context) {
                            return const PlayNowScreen();
                          },
                        );
                      },
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        thumbShape: const CustomSliderThumbShape(),
                        trackShape: const CustomSliderTrackShape(),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        onChanged: (durationValue) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      );
    });
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
    final trackTop = offset.dy;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight!);
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({super.enabledThumbRadius = 0.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}
