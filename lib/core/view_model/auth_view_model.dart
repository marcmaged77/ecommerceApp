import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:souq/core/services/firestore_user.dart';
import 'package:souq/model/user_model.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';

import 'package:http/http.dart' as http;

//gextController very good for memory leak

class AuthViewModel extends GetxController {





  //google instance
  GoogleSignIn _googleSignIn = GoogleSignIn();

  //facebook instance
  static final FacebookLogin _facebookLogin = new FacebookLogin();

  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;














  late String email, password, name;


  late  String pic;










  //SIGN UP METHOD
  Future signUp({ required String name, required String email, required String password, }) async {
    try {
      //      UserCredential result =
      //       // User? user = result.user;
      //       // user!.updateProfile(displayName: name);


      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {


        UserModel userModel = UserModel(email: user.user!.email!, userId: user.user!.uid, name: name, pic: 'pic');

        await FireStoreUser().addUserToFireStore(userModel);


      });



      return null;
    } on FirebaseAuthException catch (e) {

      print('THE ERROR : ${e.message}');

      // return e.message;
    }
  }

  // SIGN IN METHOD
  void signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(email);
      Get.offAll(homeScreen(email: email, name: null,));
    } on FirebaseAuthException catch (e) {
      print( e.message);
      Get.snackbar("error", e.toString(), colorText: Colors.black, snackPosition: SnackPosition.TOP);
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }






void facebookSignInMethod() async{



  // final facebookLogin = FacebookLogin();
final FacebookLoginResult result = await _facebookLogin.logInWithReadPermissions(['email']);





  switch (result.status) {


    case FacebookLoginStatus.loggedIn:
      final graphResponse = await http.get(
          Uri.parse(
              'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken.token}'));
      final profile = jsonDecode(graphResponse.body);



  final FacebookAccessToken accessToken =  result.accessToken ;


  email = profile['email'];
  name = profile['first_name'];
  pic = profile['picture']["data"]['url'];




      //
      UserModel userModel = UserModel(email:email, userId: result.accessToken.userId, name: name, pic : pic );

      await FireStoreUser().addUserToFireStore(userModel);

      Get.offAll(homeScreen(email: email, name: name, pic: pic,));


  print('''logged in 
      token: ${accessToken.token},
      user id : ${accessToken.userId},
      Expires: ${accessToken.expires},
      Permissions : ${accessToken.permissions},
      declined Permissions: ${accessToken.declinedPermissions}
  
      
      
      
      ''');





break;
    case FacebookLoginStatus.cancelledByUser:
print("login canceled by the user");



break;
    case FacebookLoginStatus.error:
      print('something went wrong with the login process.\n ${result.errorMessage}');
      break;
  }
//   FacebookLoginResult result = await _facebookLogin.logInWithReadPermissions(['email']);
//
// final accessToken = result.accessToken.token;
// print(result.status);
// print("facebook username : ${FacebookAuthProvider.FACEBOOK_SIGN_IN_METHOD}");
// if(result.status == FacebookLoginStatus.loggedIn){
//   final faceCredential = FacebookAuthProvider.credential(accessToken);
//   await _auth.signInWithCredential(faceCredential);
// }

}


  void signOutFacebook() async {
    await _facebookLogin.logOut();

    print("User Signed Out from facebook");
  }











  Future<String?> googleSignInMethod() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();


    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );



    final UserCredential authResult = await _auth.signInWithCredential(credential);





    final User? user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      name = user.displayName!;
      email = user.email!;
      pic = user.photoURL!;

      UserModel userModel = UserModel(email:email, userId: user.uid, name: name, pic: pic  );

      await FireStoreUser().addUserToFireStore(userModel);



      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('email', email);
      // prefs.setString('name', name);
      // prefs.setString('imageUrl', imageUrl);

      print('signInWithGoogle succeeded: $user');
      print(name);
      print(email);

      return '$user';
    }

    return null;
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Signed Out from google");
  }

void saveUser(UserCredential user) async{




    UserModel userModel = UserModel(email: user.user!.email!, userId: user.user!.uid,


        name: name,


        pic: pic  == null ? pic : '');

    await FireStoreUser().addUserToFireStore(userModel);





}




// first function to run
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //
  // when the widget is ready on screen
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  //
  // when the controller is deleted from memory
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
