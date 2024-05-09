import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:siripa_sathkaraya/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "තුන්සරණේ කවි 1",
      albumArtPath: "assets/images/sri-pada.png",
      audioPath: "audio/thunsarane_kavi1.ogg",
    ),
    Song(
      songName: "තුන්සරණේ කවි 2",
      albumArtPath: "assets/images/sri-pada1.jpg",
      audioPath: "audio/thunsarane_kavi.ogg",
    ),
    // Song(
    //   songName: "Kavi 3",
    //   albumArtPath: "",
    //   audioPath: "audio/KoheHoMa.mp3",
    // ),
  ];

  //current song
  int? _currentSongIndex = 0;

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constrctor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      if (_currentDuration == Duration.zero) {
        play();
      } else {
        resume();
      }
    }
  }

  //seek to a position in current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //not the last song
        currentSongIndex = _currentSongIndex! + 1;
        notifyListeners();
      } else {
        currentSongIndex = 0;
        notifyListeners();
      }
    }
  }

  //play previous song
  void playPreviousSong() {
    //if more than 2 seconds passed, restart current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
      notifyListeners();
    } //if duration within 2 seconds go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
        notifyListeners();
      } else {
        //if it is the first song loop back to last song
        currentSongIndex = _playlist.length - 1;
        notifyListeners();
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    // listen to total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen to current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen to song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
      notifyListeners();
    });
  }

  //getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //setters
  set currentSongIndex(int? index) {
    _currentSongIndex = index;

    if (index != null) {
      play(); //play the song of selected index
    }

    //update UI
    notifyListeners();
  }
}
