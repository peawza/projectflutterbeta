import 'package:projectflutterbeta/models/brew.dart';
import 'package:projectflutterbeta/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  final CollectionReference UserCollection =
      Firestore.instance.collection('user');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']);
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future<void> updateUserprofileData(
      String email, String Nickname, String Phone, String uid) async {
    return await UserCollection.document(uid).setData({
      'email': email,
      'Nickname': Nickname,
      'Phone': Phone,
      'uid': uid,
      'photo': 'https://sv1.picz.in.th/images/2020/03/21/QQYtet.png'
    });
  }
}
