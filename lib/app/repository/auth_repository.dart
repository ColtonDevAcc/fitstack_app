import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    AuthCache? authCache,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _cache = authCache ?? AuthCache();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final AuthCache _cache;

  Future<User?> logInWithEmailAndPassword({email: String, password: String}) {}
}
