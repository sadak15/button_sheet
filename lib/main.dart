import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TikTok Bottom Sheet Design'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _buildComment('ahmed ', 'This is a great video!'),
                    _buildComment('farax', 'I love it!'),
                    // Add more comments as needed
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      // Handle adding stickers or icons
                    },
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Handle sending the comment
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComment(String username, String comment) {
    return ListTile(
      leading: const CircleAvatar(
        // Add user avatars here
        backgroundColor: Colors.blue,
      ),
      title: Text(username),
      subtitle: Text(comment),
    );
  }
}
