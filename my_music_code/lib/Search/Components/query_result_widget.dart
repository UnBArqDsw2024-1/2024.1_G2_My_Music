import 'package:flutter/material.dart';

class QueryResultWidget extends StatefulWidget {
  const QueryResultWidget({super.key, required this.query, required this.myMusicList});
  final List<String> myMusicList;
  final String query;
  @override
  State<QueryResultWidget> createState() => _QueryResultWidgetState();
}

class _QueryResultWidgetState extends State<QueryResultWidget> {

  Widget buildSuggestions() {
    List<String> matchQuery = [];
    for (var myMusicSearch in widget.myMusicList) {
      if (myMusicSearch.toLowerCase().contains(widget.query.toLowerCase())) {
        matchQuery.add(myMusicSearch);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result,style: TextStyle(color: Colors.white)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: buildSuggestions(),
    );
  }
}