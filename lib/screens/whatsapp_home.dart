import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/screens/calls_screen.dart';
import 'package:flutter_whatsapp_clone/screens/camera_screen.dart';
import 'package:flutter_whatsapp_clone/screens/chat_screen.dart';
import 'package:flutter_whatsapp_clone/screens/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Whats App Clone"),
        elevation: 0.7,
        bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.camera_alt),
              ),
              new Tab(
                text: "CHATS",
              ),
              new Tab(
                text: "STATUS",
              ),
              new Tab(
                text: "CALLS",
              ),
            ]),
        actions: <Widget>[
          new Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        new CameraScreen(),
        new ChatScreen(),
        new StatusScreen(),
        new CallScreen(),
      ],),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message,color: Colors.white,),
        onPressed:() =>debugPrint("Tabbed!!"),),
    );
  }
}
