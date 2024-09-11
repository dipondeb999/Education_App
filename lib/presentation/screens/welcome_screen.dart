import 'package:education_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            // build top section
            _buildTopSection(context),
            // bottom section
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height / 2.666,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xFF674AEF),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height / 2.666,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: _buildText(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTopSection(context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height / 1.6,
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        Container(
          height: height / 1.6,
          width: width,
          decoration: const BoxDecoration(
            color: Color(0xFF674AEF),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
            ),
          ),
          child: Center(
            child: Image.asset(
              "assets/images/books.png",
              scale: 0.8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        children: [
          const Text(
            "Learning is Everything",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Learning with Pleasure Dear Programmer, Wherever you are.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 60),
          Material(
            color: const Color(0xFF674AEF),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  "Get Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
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
