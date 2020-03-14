import 'package:flutter/material.dart';
import 'package:projectflutterbeta/screens/authenticate/authenticate.dart';
import 'package:projectflutterbeta/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:projectflutterbeta/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
