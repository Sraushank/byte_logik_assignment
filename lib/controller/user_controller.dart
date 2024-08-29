import 'package:byte_logik_assignment/controller/db_helper.dart';
import 'package:byte_logik_assignment/controller/localstorage_services.dart';
import 'package:byte_logik_assignment/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var counter = 0.obs;
  Rxn<UserModel> _userModel = Rxn<UserModel>();

  UserModel? get userModel => _userModel.value;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void getUserData() async {
    var currentUserEmail = await LocalStorageService.getUserSession();
    await initializeUserData(email: currentUserEmail);
  }

  Future<void> initializeUserData({required String? email}) async {
    try {
      if (email != null) {
        _userModel.value = await DbHelper().getUserByEmail(email);
        if (userModel != null) {
          counter.value = userModel!.counter ?? 0;
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void increaseCounter() async {
    counter.value++;
    if (userModel != null) {
      await DbHelper().updateCount(userModel!.email, counter.value);
    }
  }
}
