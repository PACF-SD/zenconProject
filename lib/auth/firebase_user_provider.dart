import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ZenconDesInvFirebaseUser {
  ZenconDesInvFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ZenconDesInvFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ZenconDesInvFirebaseUser> zenconDesInvFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ZenconDesInvFirebaseUser>(
            (user) => currentUser = ZenconDesInvFirebaseUser(user));
