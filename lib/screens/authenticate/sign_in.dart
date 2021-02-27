import 'package:projectflutterbeta/services/auth.dart';
import 'package:projectflutterbeta/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
String error = '';
bool loading = false;

// text field state
String email = '';
String password = '';

class _SignInState extends State<SignIn> {
  bool _rememberMe = false;

  get kLabelStyle => null;

  get kBoxDecorationStyle => null;

  get kHintTextStyle => null;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/immages/backbg.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/immages/aroundthailand-Recovered.png',
                          width: 230,
                          height: 140,
                        ),

                        SizedBox(height: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email',
                              //style: kLabelStyle,
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              //alignment: Alignment.centerLeft,
                              //decoration: kBoxDecorationStyle,
                              //height: 60.0,
                              child: TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Enter your Email'
                                    : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily:
                                  'assets/ThaiSansNeue-Regular.ttf',
                                ),

                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.0
                                      )
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your Email',
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Password',
                              //style: kLabelStyle,
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              //alignment: Alignment.centerLeft,
                              //decoration: kBoxDecorationStyle,
                              //height: 60.0,
                              child: TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'Enter a password 6+ chars long'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily:
                                  'assets/ThaiSansNeue-Regular.ttf',
                                ),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.0
                                      )
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                  EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your Password',
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.white),
                                child: Checkbox(
                                  value: _rememberMe,
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Remember me',
                                //style: kLabelStyle,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child:
                          /*

                                RaisedButton(
                                  onPressed: () async {
                                    print(password);
                                    print(email);
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error =
                                              'Could not sign in with those credentials';
                                        });
                                      }
                                    }
                                  },
                                  color: Colors.deepOrange,
                                  textColor: Colors.white,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                                */

                          RaisedButton(
                            elevation: 5.0,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(
                                    email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                    'Could not sign in with those credentials';
                                  });
                                }
                              }
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.white,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                'assets/ThaiSansNeue-Regular.ttf',
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '- OR -',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () => widget.toggleView(),
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.white,
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                'assets/ThaiSansNeue-Regular.ttf',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    /*
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
                            Image.asset(
                              'assets/immages/aroundthailand-Recovered.png',
                              width: 200,
                              height: 120,
                            ),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'email'),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 1.0),
                            TextFormField(
                              obscureText: true,
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'password'),
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
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error =
                                            'Could not sign in with those credentials';
                                      });
                                    }
                                  }
                                },
                                color: Colors.deepOrange,
                                textColor: Colors.white,
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: RaisedButton(
                                onPressed: () => widget.toggleView(),
                                color: Colors.green,
                                textColor: Colors.black,
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
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
            */
  }
}