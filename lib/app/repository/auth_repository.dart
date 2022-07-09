import 'package:FitStack/app/cache/auth_cache.dart';
import 'package:FitStack/app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    fb.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    AuthCache? authCache,
  })  : _firebaseAuth = firebaseAuth ?? fb.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _cache = authCache ?? AuthCache();

  final fb.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final AuthCache _cache;
  static const userCacheKey = 'us';

  Future<User?> logInWithEmailAndPassword({email: String, password: String}) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then(
          (value) => value.user != null ? User.fromFirebase(value.user!) : User.empty,
        );
  }

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : User.fromFirebase(firebaseUser);
      _cache.writeToCache(key: userCacheKey, value: user.toString());
      return user;
    });
  }

  User get currentUser {
    return _cache.readUserFromCache();
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        // _googleSignIn.signOut(),
      ]);
    } catch (e) {
      throw e;
    }
  }
}
