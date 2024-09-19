import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showFloatingSearchBar(BuildContext context) {
  showSearch(
    context: context,
    delegate: SearchBarDelegate(),
  );
}


// Create a class for the search bar delegate
class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return query.isEmpty
        ? []
        : [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results page as before
    return Center(
      child: Container(
        color: Colors.blueGrey, // Example background color
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Search Results for "$query":',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            // _buildNumberedList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement suggestions as before
    final suggestions = query.isEmpty
        ? []
        : ['Hii', 'Bye']
        .where((word) => word.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Example background color
        body: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                suggestions[index],
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                query = suggestions[index];
                showResults(context);
              },
            );
          },
        ),
      ),
    );
  }
}
