import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/controller/signup_controller.dart';
import 'package:first_project/view/page/district_list_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:first_project/view/page/signup_page.dart';
import 'package:first_project/view/screen/main_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  User? get user => _user.value;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signup() => SingupController().registerWithEmailAndPassword;

  login(id, pw, ispersisted) => _firebaseAuth
      .signInWithEmailAndPassword(email: id, password: pw)
      .then((_) => true)
      .catchError((_) => false);

  logout() => _firebaseAuth.signOut();

  resetPassword(email) => _firebaseAuth.sendPasswordResetEmail(email: email);

  checkAuthSignup() async {
    var prefs = await SharedPreferences.getInstance();
    var isAutoSignupOn = prefs.getBool('isAutoSignupOn') ?? true;
    if (!isAutoSignupOn) await logout();
  }

@override
void onInit() async {
  super.onInit();
  await checkAuthSignup();
  FirebaseAuth.instance.authStateChanges().listen((value) async {
    _user(value);
    if (value != null) {
      await Get.offAllNamed(DistrictList.route);
    } else {
      await Get.offAllNamed(LoginPage.route);
    }
  });
}}
