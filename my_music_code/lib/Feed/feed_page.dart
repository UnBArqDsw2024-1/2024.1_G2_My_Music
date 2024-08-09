import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';

class DefaultPlaceholder{
  static const String title = "Default";
  static const String image = "";
  static const Color backgroundColor =Color(0xff373737);
}

class MusicPlaylistFeedComponent extends StatelessWidget {
  const MusicPlaylistFeedComponent({
    super.key, 
    this.title = DefaultPlaceholder.title, 
    this.thumbnailUrl = DefaultPlaceholder.image, 
    this.backgroundColor = DefaultPlaceholder.backgroundColor
  });
  final String thumbnailUrl;
  final String title;
  final Color backgroundColor;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 160,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(thumbnailUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SizedBox(width: 5),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}




class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Feed", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 275,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.search, color: Colors.white),
                              SizedBox(width: 5),
                              Text("Search", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),

                        SizedBox(width: 10),
                        
                        Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.search, color: Colors.white),
                              SizedBox(width: 5),
                              Text("Search", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    )
                    
                  ]
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 210,
              color: Colors.green,
              child: Column(
                children: const [
                ]
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 130,
              color: Colors.purple,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                ]
              ),
            ),
            SizedBox(height: 10),
            // Tocas recentemente 
            Container(
              width: double.infinity,
              height: 130,
              color: Colors.purple,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                ]
              ),
            ),
          ],
        ),
      )
    );
  }
}