import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

import '../../models/project_model.dart';

class ProjectBanner extends StatefulWidget {
  const ProjectBanner({super.key, required this.project});

  final ProjectModel project;

  @override
  _ProjectBannerState createState() => _ProjectBannerState();
}

class _ProjectBannerState extends State<ProjectBanner> {
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    final video = widget.project.video;
    if (video != null) {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(video),
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
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: widget.project.video != null
          ? FlickVideoPlayer(flickManager: flickManager!)
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.project.banner.provider(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
