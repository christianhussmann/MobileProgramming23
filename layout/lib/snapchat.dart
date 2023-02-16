import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapchatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(mainAxisSize: MainAxisSize.min, children: [
          _buildNavButton(image: AssetImage("assets/person.jpg")),
          _buildNavButton(child: Icon(Icons.search_rounded)),
        ]),
        middle: Text("Chat"),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          _buildNavButton(child: Icon(Icons.person_add)),
          _buildNavButton(child: Icon(Icons.more_horiz)),
        ]),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            _buildChatList(howMany: 50),
            _buildActionPanel(),
            _buildWriteFab()
          ],
        ),
      ),
    );
  }

  Transform _buildWriteFab() {
    return Transform.translate(
      offset: Offset(-20, -130),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message_outlined),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }

  Widget _buildActionPanel() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(15), // Border width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.location_pin),
                _buildActionButton(Icons.chat_bubble),
                _buildActionButton(Icons.camera_alt_outlined),
                _buildActionButton(Icons.people_alt_outlined),
                _buildActionButton(Icons.play_arrow_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CupertinoButton _buildActionButton(IconData iconData) {
    return CupertinoButton(
      onPressed: () {},
      child: Icon(iconData, color: Colors.grey[900], size: 35),
    );
  }

  final ScrollController _controller = ScrollController();
  Widget _buildChatList({required int howMany}) {
    return CupertinoScrollbar(
      controller: _controller,
      child: ListView.separated(
        controller: _controller,
        itemCount: howMany,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => CupertinoListTile(
          key: ValueKey(index),
          leadingSize: 50,
          leading: CircleAvatar(
            foregroundImage: AssetImage('assets/person${index % 20}.jpg'),
          ),
          title: Text("Person"),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 16,
                color: Colors.blue,
              ),
              SizedBox(width: 3),
              Text("Received")
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 18,
                child: Text(
                  "😊",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              _buildTileButton(Icon(Icons.photo_camera_outlined)),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTileButton(Widget child) {
    return Padding(padding: EdgeInsets.all(5), child: child);
  }

  Widget _buildNavButton({Widget? child, AssetImage? image}) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[800],
        backgroundImage: image,
        child: child,
      ),
    );
  }
}
