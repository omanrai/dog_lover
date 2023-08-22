import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google sign in
  signInWithGoogle() async {
    //begin interactive sign in preocess

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //let's sign in
    // final userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // //email and password sign in
  // signInWithEmailAndPassword(String email, String password) async {
  //   //create a new user
  //   final userCredential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password);
  //   //let's sign in
  // }

  // //sign out
  // signOut() async {
  //   //sign out user
  //   await FirebaseAuth.instance.signOut();
  //   //let's sign out
  // }

  // //register with email and password
  // registerWithEmailAndPassword(String email, String password) async {
  //   //create a new user
  //   final userCredential = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password);
  //   //let's sign in
  // }

  // //reset password
  // resetPassword(String email) async {
  //   //reset password
  //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //   //let's reset password
  // }

  // //sign in with phone number
  // signInWithPhoneNumber(String phoneNumber) async {
  //   //begin interactive sign in preocess
  //   final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId, smsCode: smsCode);
  //   //sign in user
  //   final userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   //let's sign in
  // }
  
}
