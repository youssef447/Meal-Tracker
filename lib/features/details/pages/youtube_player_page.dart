import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:meal_tracking/core/widgets/loading/app_circle_progress.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../core/theme/data/app_text_style.dart';

class YouTubePlayerPage extends StatefulWidget {
  final String youtubeUrl;

  const YouTubePlayerPage({super.key, required this.youtubeUrl});

  @override
  YouTubePlayerPageState createState() => YouTubePlayerPageState();
}

class YouTubePlayerPageState extends State<YouTubePlayerPage> {
  late BetterPlayerController _betterPlayerController;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    _setupPlayer();

    super.initState();
  }

  Future<void> _setupPlayer() async {
    try {
      //  video URL from YouTube URL
      final videoUrl = await _getYouTubeDirectUrl(widget.youtubeUrl);

      // Setup BetterPlayer
      _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          autoPlay: true,
          autoDispose: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableSubtitles: false,
            enableFullscreen: true,
          ),
        ),
        betterPlayerDataSource: BetterPlayerDataSource(
            BetterPlayerDataSourceType.network, videoUrl,
            videoExtension: 'mp4'),
      );

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load video';
        _isLoading = false;
      });
    }
  }

  Future<String> _getYouTubeDirectUrl(String youtubeUrl) async {
    final yt = YoutubeExplode();
    try {
      final videoId = VideoId.parseVideoId(youtubeUrl);
      final streamManifest = await yt.videos.streamsClient.getManifest(videoId);

      final streamInfo = streamManifest.videoOnly.withHighestBitrate();
      return streamInfo.url.toString();
    } finally {
      yt.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube Ad', style: AppTextStyles.font18BoldText(context)),
      ),
      body: _isLoading
          ? const AppCircleProgress()
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : BetterPlayer(controller: _betterPlayerController),
    );
  }
}
