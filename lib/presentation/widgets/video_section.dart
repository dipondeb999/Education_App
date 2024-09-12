import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> videoList = [
      "Introduction to Flutter",
      "Installing Flutter on Windows",
      "Setup Emulator on Windows",
      "Creating our First App",
    ];

    List<String> videosTime = [
      "20 min 50 sec",
      "18 min 40 sec",
      "15 min 30 sec",
      "30 min 59 sec",
    ];

    return ListView.builder(
      itemCount: videoList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                  ? const Color(0xFF674AEF)
                  : const Color(0xFF674AEF).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
              videoList[index],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(videosTime[index]),
        );
      },
    );
  }
}
