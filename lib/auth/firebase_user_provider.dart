import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class KaryaMeetPointFirebaseUser {
  KaryaMeetPointFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

KaryaMeetPointFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KaryaMeetPointFirebaseUser> karyaMeetPointFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<KaryaMeetPointFirebaseUser>(
      (user) {
        currentUser = KaryaMeetPointFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
