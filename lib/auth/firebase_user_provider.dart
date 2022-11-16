import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AgendaShowsFirebaseUser {
  AgendaShowsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AgendaShowsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AgendaShowsFirebaseUser> agendaShowsFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AgendaShowsFirebaseUser>(
      (user) {
        currentUser = AgendaShowsFirebaseUser(user);
        return currentUser!;
      },
    );
