import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:projectflutterbeta/screens/home/pang/test2.dart';
import 'package:provider/provider.dart';
import 'package:projectflutterbeta/models/user.dart';

final database = Firestore.instance;

class MessageScreen extends StatefulWidget {
  final String UID;


  MessageScreen(this.UID);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final CometChat _cometChat = CometChat();
  final _formKey = GlobalKey<FormState>();
  final List<String> _messages = [];
  String _currentMessage;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

/*
  @override
  void initState() {
    super.initState();
    _cometChat.initMethodChannel();
    _cometChat.initEventChannel();
    _cometChat.joinGroup().whenComplete(() {
      _cometChat.stream.receiveBroadcastStream().listen((value) {
        setState(() {
          _messages.add(value);
        });
      });
    });
  }

 */

  @override
  void dispose() {
    _textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500),
        () => _controller.jumpTo(_controller.position.maxScrollExtent));
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Chat Room"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              messageList(),
              messageInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded messageList() {
    return Expanded(
      flex: 2,
      child: StreamBuilder(
          stream: Firestore.instance
              .collection("Message")
              .orderBy('Time')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text('Loading...');
            return new ListView(
              controller: _controller,
              children: snapshot.data.documents.map((document) {
                if(document['SenderUID'] == widget.UID){
                  return
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Container(),
                          ),
                          Flexible(
                            child: Card(
                              elevation: 5.0,
                              color: Colors.amberAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  document['Message'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          photo(document['SenderUID']),
                        ],
                      ),
                    );
                }
                else{
                  //Other's message
                  print('1');
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        photo(document['SenderUID']),
                        Flexible(
                          child: Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                document['Message'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(),
                        ),
                      ],
                    ),
                  );


                }

                //return Container();



              }).toList(),
            );
          }),
    );
  }

  Padding messageInputArea() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: _textController,
                validator: (val) => val.isEmpty ? '' : null,
                onChanged: (val) {
                  setState(() => _currentMessage = val);
                },

                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Enter Message",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: RaisedButton(
                /*
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth
                          .registerWithEmailAndPassword(email, password , Nickname ,Phone);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Please supply a valid email';
                        });
                      }
                    }
                  }

                 */
                onPressed: () async{
                  //แก้ไข
                  if(_formKey.currentState.validate()){

                  _textController.clear();
                  //_cometChat.sendMessage(userMessage: _currentMessage);

                  database.collection("Message").document().setData({
                    'SenderUID': widget.UID,
                    'Message': _currentMessage,
                    'Time': DateTime.now()
                  });
                  var data = {
                    'Message': _currentMessage,
                    'SenderUID': widget.UID
                  };
                  }
                }, //
                child: Text("Send"),
              ),
            )
          ],
        ),
      ),
    );
  }


}

class CometChat {
  MethodChannel _platform;
  EventChannel _stream;

  EventChannel get stream => _stream;

  void initMethodChannel() {
    _platform = const MethodChannel('com.sagar.gossip/initialize');
  }

  void initEventChannel() {
    _stream = const EventChannel('com.sagar.gossip/message');
  }

  //Method to initialize the CometChat SDK
  Future<String> init() async {
    String isInitialized = "Not Initialized";
    try {
      final bool result =
          await _platform.invokeMethod('isCometChatInitialized');
      isInitialized = "Comet was initialized successfully $result";
    } on PlatformException catch (e) {
      isInitialized = e.message;
    }
    return isInitialized;
  }

  //Login a user using API_KEY and UID of the user
  Future<String> login({@required String uid, @required String apiKey}) async {
    String status = "";
    try {
      final String result = await _platform
          .invokeMethod('loginUser', {"UID": uid, "API_KEY": apiKey});
      Map finalResult = json.decode(result);
      if (finalResult['RESULT']) {
        status = "Logged in successfully";
      } else {
        status = "Login failed";
      }
    } on PlatformException catch (e) {
      print("Exception");
      status = e.message;
    }
    return status;
  }

  Future<String> joinGroup() async {
    String status = "";
    try {
      final bool result =
          await _platform.invokeMethod('joinGroup', {'GUID': 'dc_superheroes'});
      if (result) {
        status = "Success";
      } else {
        status = "Failed";
      }
    } on PlatformException catch (e) {
      status = e.message;
    }
    return status;
  }

  //Send message to the user
  Future<String> sendMessage({@required String userMessage}) async {
    String status = "";
    try {
      final bool result = await _platform.invokeMethod('sendMessage',
          {"ROOM_ID": 'dc_superheroes', "MESSAGE": "$userMessage"});
      if (result) {
        status = "Message send successfully";
      } else {
        status = "Message was not sent";
      }
    } on PlatformException catch (e) {
      status = e.message;
    }
    print(status);
    return status;
  }
}

class Listdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('Message').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((document) {
            return new ListTile(
              title: new Text(document['Message']),
              subtitle: new Text(document['SenderUID']),
            );
          }).toList(),
        );
      },
    );



  }
}



class dataDetails extends StatefulWidget {
  String userUID;
  String mess;
  dataDetails(this.userUID,this.mess);
  @override
  _dataDetailsState createState() => _dataDetailsState();
}

class _dataDetailsState extends State<dataDetails> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('user')
          .document(widget.userUID)
          .snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              child: Text(snapshot.data['Nickname']),
            ),
          );
        }
        return Column();

      }
    );
  }
}
class photo extends StatefulWidget {
  String userUID;
  photo(this.userUID);
  @override
  _photoState createState() => _photoState();
}

class _photoState extends State<photo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('user')
            .document(widget.userUID)
            .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return CircleAvatar(
              backgroundImage: NetworkImage(
                  snapshot.data['photo']),
              backgroundColor: Colors.white,
            );
          }
          return Column();

        }
    );
  }
}


