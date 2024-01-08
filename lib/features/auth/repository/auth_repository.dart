import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interactopia/core/constants/constants.dart';
import 'package:interactopia/core/constants/firebase_constants.dart';
import 'package:interactopia/core/providers/firebase_provider.dart';
import 'package:interactopia/models/user_model.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _user => _firestore.collection(FirebaseConstants.usersCollection);

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = (await googleUser?.authentication);
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel userModel = UserModel(
          name: userCredential.user!.displayName ?? "No Name",
          profilePic: userCredential.user!.photoURL ?? Constants.defaultPfp,
          uid: userCredential.user!.uid,
          isAuthenticated: "true",
          banner: Constants.bannerDefault,
          karma: 0,
          awards: []);
      await _user.doc(userModel.uid).set(userModel.toMap());
    } catch (e) {
      print(e);
    }
  }
}
