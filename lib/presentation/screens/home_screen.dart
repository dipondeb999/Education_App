import 'package:education_app/presentation/screens/course_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> categoryNames = [
    "Category",
    "Classes",
    "Free Course",
    "Book Store",
    "Live Course",
    "Leader Board",
  ];

  List<Color> categoryColors = [
    const Color(0xFFFFCF2F),
    const Color(0xFF6FE08D),
    const Color(0xFF61BDFD),
    const Color(0xFFFC7F7F),
    const Color(0xFFCB84FB),
    const Color(0xFF78E667),
  ];

  List<Icon> categoryIcons = [
    const Icon(Icons.category, color: Colors.white, size: 30),
    const Icon(Icons.video_library, color: Colors.white, size: 30),
    const Icon(Icons.assessment, color: Colors.white, size: 30),
    const Icon(Icons.store, color: Colors.white, size: 30),
    const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    const Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  List<String> imagesTitle = [
    "Flutter",
    "React Native",
    "Python",
    "C#",
  ];

  List<String> imageList = [
    "assets/images/flutter.png",
    "assets/images/react _native.png",
    "assets/images/python.png",
    "assets/images/C#.png",
  ];

  List<String> totalVideos = [
    "55 Videos",
    "50 Videos",
    "40 Videos",
    "60 Videos",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // appBar
          Container(
            padding:
                const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: _buildCustomAppBar(context),
          ),
          // build category items
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: Column(
              children: [
                // build category items
                _buildCategoryItems(context),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF674AEF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // build course items
                _buildCourseItems(context),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _myBottomNavigationBar(),
    );
  }

  Widget _buildCustomAppBar(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // custom appBar
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.dashboard,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 3, bottom: 15),
          child: Text(
            "Hi, Programmer",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
        ),
        // build search bar
        _buildSearchBar(context),
      ],
    );
  }

  Widget _buildSearchBar(context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 20),
      height: 45,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
          ),
          hintText: "Search here...",
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItems(context) {
    return GridView.builder(
      itemCount: categoryNames.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: categoryColors[index],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: categoryIcons[index],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              categoryNames[index],
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCourseItems(context) {
    return GridView.builder(
      itemCount: imageList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: (MediaQuery.of(context).size.height - 50 -25) / (4 * 240),
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CourseScreen(imagesTitle[index])));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    imageList[index],
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  imagesTitle[index],
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  totalVideos[index],
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _myBottomNavigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      iconSize: 32,
        selectedFontSize: 16,
        selectedItemColor: const Color(0xFF674AEF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ]
    );
  }
}
