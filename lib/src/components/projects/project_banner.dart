import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../models/project_model.dart';

class ProjectBanner extends StatefulWidget {
  const ProjectBanner({super.key, required this.project});

  final ProjectModel project;

  @override
  _ProjectBannerState createState() => _ProjectBannerState();
}

class _ProjectBannerState extends State<ProjectBanner> {
  FlickManager? flickManager;
  final visibilityKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    final video = widget.project.video;
    if (video != null) {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(video),
        autoPlay: false,
      );
    }
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibilityKey,
      onVisibilityChanged: onPlayerVisibilityChanged,
      child: flickManager != null
          ? FlickVideoPlayer(flickManager: flickManager!)
          : AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.project.banner.provider(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }

  void onPlayerVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction < 0.3 &&
        flickManager?.flickVideoManager?.isPlaying == true) {
      flickManager?.flickControlManager?.pause();
    }
  }
}
