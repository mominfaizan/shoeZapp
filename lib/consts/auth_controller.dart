import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //textcontroller
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  //login
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    if (userCredential == null) {}
    return userCredential;
  }

//sign up
  Future<UserCredential?> signupmethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

//storing data method
  storedata({name, password, email}) async {
    DocumentReference store =
        await firestore.collection(usersCollection).doc(currentUser?.uid);
    store.set(
        {'name': name, 'password': password, 'email': email, 'imageUrl': ''});
    print('name:$name pass $password email $email');
  }

//sign out method
  signout({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
