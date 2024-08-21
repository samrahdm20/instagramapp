import 'package:aplikasi_instagram/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Instagram",
            style: GoogleFonts.pacifico(
                textStyle: const TextStyle(color: Colors.black, fontSize: 28)),
          ),
          actions: const <Widget>[
            Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
            SizedBox(
              width: 25,
            ),
            // give the background white for icon facebook messenger

            Icon(
              FontAwesomeIcons.facebookMessenger,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileCircle("assets/Profile 1.jpg"),
                _buildProfileCircle("assets/Profile 2.jpg"),
                _buildProfileCircle("assets/Profile 3.jpg"),
                _buildProfileCircle("assets/Profile 4.jpg"),
              ],
            ),
            const Divider(height: 20, thickness: 2),
            Expanded(
              child: ListView(
                children: <Widget>[
                  postItem(
                    "assets/Profile 3.jpg",
                    "assets/Post 3.jpg",
                    "aleeya23",
                  ),
                  postItem(
                      "assets/Profile 1.jpg", "assets/Post 1.jpg", "samrahdm"),
                  postItem("assets/Profile 2.jpg", "assets/Post 2.jpg",
                      "chairilali_13"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 26,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.search,
                        size: 28,
                      ),
                      SizedBox(width: 50),
                      Icon(
                        Icons.add_box_rounded,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.video_library),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfile(),
                          ));
                    },
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/Profile 3.jpg',
                    ),
                    radius: 12,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildProfileCircle(String imagePath) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget postItem(
      String profileImagePath, String postImagePath, String username) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(profileImagePath),
          ),
          title: Text(username,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 9.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              postImagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 10),
                  Icon(Icons.send),
                ],
              ),
              Icon(
                Icons.bookmark_border,
                size: 29,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Liked by someone and others",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Text(
            "View all comments",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
