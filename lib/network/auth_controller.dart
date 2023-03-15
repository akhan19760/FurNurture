import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_store/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthNetwork {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  createNewUser({required email, required password, required name}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      await users.doc(user.user!.uid).set({
        'uid': user.user!.uid,
        'name': name,
        'email': email,
        'phone': '',
        'address': '',
      });
    });
  }

  getUserProfile({required uid}) async {
    var document = await users.doc(uid).get();
    print('From Network> ${document.data()}');
    return document;
  }

  updateUserProfile({required UserModel user, required uid}) async {
    await users.doc(uid).update({
      'uid': user.uid,
      'email': user.email,
      'name': user.name,
      'phone': user.phone,
      'address': user.address,
    });
    var document = await users.doc(uid).get();
    print('From Network> ${document.data()}');
    return document;
  }

  signInUser({required email, required password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  forgotPassword({required email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  googleSignIn() async {
    final firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    await firebaseAuth.signInWithCredential(credential).then((user) async {
      var doc = await users.doc(user.user!.uid).get();

      if (!doc.exists) {
        await users.doc(user.user!.uid).set({
          'uid': user.user!.uid,
          'name': '',
          'email': user.user!.email,
          'phone': '',
          'address': '',
        });
      }
    });
    var currentUser = await users.doc(FirebaseAuth.instance.currentUser!.uid);
    return currentUser;
  }
}
