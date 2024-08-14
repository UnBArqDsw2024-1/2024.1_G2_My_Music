import 'package:flutter/material.dart';
import 'package:my_music_code/Globals/style.dart';
import 'package:my_music_code/Profile/add_friend_page.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int friends =
        30; // Número de amigos para teste, futuramente pegar da database

    List<Widget> friendsWidgets = List.generate(
      friends,
      (index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(DefaultPlaceholder.image),
        ),
        title: Text(
          'Amigo $index',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Seus Amigos',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: ElevatedButton(
          child: Text(""),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Widget> friendsWidget = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // @override
  // List<Widget> buildLeading(BuildContext context) {}

  @override
  List<Widget> buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var friends in friendsWidget) {
      if (friends.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(friends);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  List<Widget> buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var friends in friendsWidget) {
      if (friends.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(friends);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );    
  }
}

// Expanded(
//   child: ListView(
//     children: friendsWidgets,
//   ),
// ),
