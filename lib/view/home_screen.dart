import 'package:byte_logik_assignment/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/db_helper.dart';
import '../controller/localstorage_services.dart';
import '../model/user_model.dart';
import 'auth_screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authController = Get.put(AuthController());
  final controller = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      floatingActionButton: FloatingActionButton.extended(
         label: Text("Increase",style: TextStyle(color: Colors.white),),
        elevation: 8,
        onPressed: controller.increaseCounter,
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Dashboard',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
        actions: [
          PopupMenuButton<String>(
            iconColor: Colors.white,
            surfaceTintColor: Colors.orange.withOpacity(0.7),
            onSelected: (value) {
              if (value == 'logout') {
                authController.logout();
                Get.off(() => const LoginScreen());
                Get.snackbar("Logout success", "", backgroundColor: Colors.green);

              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logout"),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PhysicalModel(
              color: Colors.orange,
              elevation: 10,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4),
                child: Obx(
                  ()=> Text(
                    "Hi ${controller.userModel?.name}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PhysicalModel(
                    color: Colors.orange,
                    elevation: 8,
                    shape: BoxShape.circle,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.orange,
                      child:  Obx(
                        ()=>Text(
                          "${controller.counter.value}",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Your Countings",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
