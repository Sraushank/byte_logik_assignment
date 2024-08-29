
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../view/home_screen.dart';
import '../view/auth_screen/login_screen.dart';
import 'db_helper.dart';
import 'localstorage_services.dart';

class AuthController extends GetxController {
  var authService = DbHelper();
  var isLoggedIn = false.obs;
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    authService.initDb();

  }

  Future<void> checkLoginStatus() async {
    String? userEmail = await LocalStorageService.getUserSession();
    print(userEmail);
    if (userEmail != null) {
      isLoggedIn.value = true;
      Get.offAll(() => HomeScreen());
    } else {
      isLoggedIn.value = false;
      Get.offAll(() => LoginScreen());
    }
  }

  Future<bool> login(String email, String password) async {
    var user = await authService.loginUser(email, password);
    if (user != null) {
      await LocalStorageService.saveUserSession(email);
      this.user.value = user;
      return true;
    } else {
      return false;
    }
  }

  Future<void> signup(String name, String email, String password) async {
    var newUser = UserModel(name: name, email: email, password: password);
    await authService.registerUser(newUser);
    await LocalStorageService.saveUserSession(email);
    this.user.value = newUser;
    Get.offAll(() => HomeScreen());
  }

  Future<void> logout() async {
    await LocalStorageService.clearUserSession();
    user.value = null;
    Get.offAll(() => const LoginScreen());
  }

}
