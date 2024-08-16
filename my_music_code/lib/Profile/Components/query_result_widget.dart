import 'package:flutter/material.dart';

class QueryResultWidget extends StatefulWidget {
  const QueryResultWidget({super.key, required this.query, required this.friendsList});
  final List<String> friendsList;
  final String query;
  @override
  State<QueryResultWidget> createState() => _QueryResultWidgetState();
}

class _QueryResultWidgetState extends State<QueryResultWidget> {

  Widget buildSuggestions() {
    List<String> matchQuery = [];
    for (var friends in widget.friendsList) {
      if (friends.toLowerCase().contains(widget.query.toLowerCase())) {
        matchQuery.add(friends);
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
