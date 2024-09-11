import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  String imagesTitle;
  String imageList;
  String totalVideos;
  CourseScreen(this.imagesTitle, this.imageList, this.totalVideos,{super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isVideoSection = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
            widget.imagesTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.notifications,
              color: Color(0xFF674AEF),
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            // build video section
            _buildVideoSection(),
            const SizedBox(height: 15),
            // build title section
            _buildTitleSection(),
            const SizedBox(height: 20),
            // build buttonBar
            _buildButtonBar(),
          ],
        ),
      ),
    );
  }
  Widget _buildVideoSection() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(5),
      height: 200,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        image: DecorationImage(
          image: AssetImage("${widget.imageList}"),
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Color(0xFF674AEF),
            size: 45,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.imagesTitle} Complete Course",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Create by Dear Programmer",
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          widget.totalVideos,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            color: isVideoSection ? const Color(0xFF674AEF) : const Color(0xFF674AEF),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                isVideoSection = true;
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: const Text(
                  "Videos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: isVideoSection ? const Color(0xFF674AEF). withOpacity(0.6) : const  Color(0xFF674AEF),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                isVideoSection = false;
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: const Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
