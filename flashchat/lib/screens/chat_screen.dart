import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController=TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  User? loggedInUser;

  String? messageText;
  void getCurrentUser() {
    try {
      final _user = _auth.currentUser;
      if (_user != null) {
        loggedInUser = _user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final _messages =
        await _fireStore.collection('messages').get(); //list of snapshots
    for (var message in _messages.docs) {
      print(message.data()['text']);
    }
  }

  void messagesStreem() async {
    await for (var snapshot in _fireStore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data()['text']);
      }
    } //list of futures
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _fireStore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MessageBubble> messageWidgets = [];
                    final messages = snapshot.data!.docs.reversed;
                    for (var message in messages) {
                      final messageText = message['text'];
                      final messageSender = message['sender'];
                      final currentUser= loggedInUser!.email;
                      if(currentUser==messageSender)
                        {

                        }
                      var messageWidget = MessageBubble(


                          sender: messageSender, message: messageText,isMe: currentUser==messageSender);
                      messageWidgets.add(messageWidget);
                    }
                    return Expanded(
                        child: ListView(
                          reverse: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      children: messageWidgets,
                    ));
                  }
                  return CircularProgressIndicator();
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: messageTextController,
                      onChanged: (value) {
                        setState(() {
                          messageText = value;
                        });
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _fireStore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser!.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final bool isMe;
  const MessageBubble({required this.sender, required this.message,required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender,style: TextStyle(color: Colors.black38,fontSize: 12),),
          Material(

            borderRadius:isMe? BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)):BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
            elevation: 5,
            color: isMe? Colors.lightBlueAccent:Colors.white,
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                  message,
                style: TextStyle(

                    color: isMe? Colors.white: Colors.black38 , fontSize: 16.0,),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
