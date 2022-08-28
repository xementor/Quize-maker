import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class AuthService {
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get getUser => _auth.currentUser;
  Stream<User?> get userStream => _auth.authStateChanges();

  // Web signin
  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    // googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<void> anonLogin() async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException {
      // handle erro
      print('something happen on anonLogin');
    }
  }

  Future<void> singOut() async {
    await _auth.signOut();
  }

  Future<void> updateUserData(User user) async {
    DocumentReference reportRef = _db.collection('reports').doc(user.uid);
    return reportRef.set({'uid': user.uid, 'lastActivity': DateTime.now()},
        SetOptions(merge: true));
  }
}
