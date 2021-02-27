class Useridprofile {
  final String uid;

  Useridprofile({this.uid});
}

class Userprofile {
  final String email;
  final String pickname;
  final String phone;
  final String photo;

  Userprofile({this.email, this.pickname, this.phone, this.photo});
}

class UserprofileData {
  final String email;
  final String pickname;
  final String phone;
  final String photo;
  final String uid;

  UserprofileData(
      {this.email, this.pickname, this.phone, this.photo, this.uid});
}

/*

class User {

  final String uid;

  User({ this.uid });

}


class Brew {
  final String name;
  final String sugars;
  final int strength;

  Brew({this.name, this.sugars, this.strength});
}





class UserData {

  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({ this.uid, this.sugars, this.strength, this.name });




}
*/
