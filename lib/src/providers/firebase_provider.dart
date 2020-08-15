import 'package:apod_app/src/models/apod_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreProvider {

  final CollectionReference _apodFavoritesCR = Firestore.instance.collection('apod_favorites');

  Future<void> saveApodImage (Apodimage apodImage){
      return _apodFavoritesCR.document().setData(apodImage.toMap());

  }

  Stream<QuerySnapshot> getSavedImages() {
      return _apodFavoritesCR.snapshots();
  }

  Future<void> removeApodImage (String documentID){
      return _apodFavoritesCR.document(documentID).delete();
  }


}

class FirebaseAuthProvider {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
   Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

}