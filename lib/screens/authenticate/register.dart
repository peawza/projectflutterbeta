import 'package:projectflutterbeta/services/auth.dart';
import 'package:projectflutterbeta/shared/constants.dart';
import 'package:projectflutterbeta/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String Nickname = '';
  String Phone ='';


  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            /*
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign up to Brew Crew'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),*/
            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('กรุณากรอกข้อมูล',style: TextStyle(fontSize: 20),),
                        ),
                        Divider(),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Nickname',
                              labelStyle: TextStyle(fontSize: 20.0)
                          ),
                          validator: (val) => val.isEmpty ? 'Enter an Nickname' : null,
                          onChanged: (val) {
                            setState(() => Nickname = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(fontSize: 20.0)
                          ),
                          validator: (val) => val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 20.0)
                          ),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Phone',
                              labelStyle: TextStyle(fontSize: 20.0)
                          ),
                          validator: (val) => val.isEmpty ? 'Enter an Phone' : null,
                          onChanged: (val) {
                            setState(() => Phone = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        Row(children: <Widget>[

                          RaisedButton(
                              color: Colors.pink[400],
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),

                            onPressed: () => widget.toggleView(),
                              ),
                          SizedBox(width: 132),
                          RaisedButton(
                              color: Colors.pink[400],
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
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
                              }),
                        ],
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
