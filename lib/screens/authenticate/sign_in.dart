import 'package:projectflutterbeta/services/auth.dart';
import 'package:projectflutterbeta/shared/constants.dart';
import 'package:projectflutterbeta/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
        /*
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),*/
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        child: Container(
                          width: 400,
                          height: 400,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 400,
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset('assets/immages/aroundthailand-Recovered.png',width: 200,height: 120,),
                            TextFormField(
                              decoration:
                              textInputDecoration.copyWith(hintText: 'email'),
                              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),

                            SizedBox(height: 1.0),

                            TextFormField(
                              obscureText: true,
                              decoration:
                              textInputDecoration.copyWith(hintText: 'password'),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            Container(
                              width: 150,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth
                                        .signInWithEmailAndPassword(email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error =
                                        'Could not sign in with those credentials';
                                      });
                                    }
                                  }
                                }
                                ,
                                color: Colors.deepOrange,textColor: Colors.white,
                                child: Text('Login',style: TextStyle(
                                    fontSize: 15.0
                                ),),),
                            ),
                            Container(
                              width: 150,
                              child: RaisedButton(
                                onPressed: () => widget.toggleView()
                              ,color: Colors.green,textColor: Colors.black,
                                child: Text('Register',style: TextStyle(
                                    fontSize: 15.0
                                ),),),
                            ),

                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
  }
}


/*

Container(
                              width: 250,
                              child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.deepOrange,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.person,color: Colors.white),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                        ),
                                        width: 200,
                                        height: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'E-mail',
                                                fillColor: Colors.white,
                                                filled: true
                                            ),

                                            validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            },
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.deepOrange,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.person,color: Colors.white),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                        ),
                                        width: 200,
                                        height: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Password',
                                                fillColor: Colors.white,
                                                filled: true
                                            ),

                                            obscureText: true,
                                            validator: (val) => val.length < 6
                                                ? 'Enter a password 6+ chars long'
                                                : null,
                                            onChanged: (val) {
                                              setState(() => password = val);
                                            },
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black
                                            ),

                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),

 */