import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:getx_mv_vm/screen_one.dart';
import 'package:getx_mv_vm/screen_tow.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
        elevation: 2,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ListTile(
                title: Text("Shahriar"),
                subtitle: Text("Tap on this"),
                tileColor: Colors.tealAccent,
                onTap: (){
                  Get.defaultDialog(
                    title: "Delete Chat",
                    middleText: "Are you sure you want to delete this chat? ",
                    titlePadding: EdgeInsets.only(top: 10),
                    contentPadding: EdgeInsets.all(10),
                    textConfirm: "Yes",
                    textCancel: "No",
                  );
                },
              ),
              ListTile(
                title: Text("Al Shahriar"),
                subtitle: Text("Tap on this"),
                tileColor: Colors.blueGrey,
                onTap: (){
                  Get.defaultDialog(
                    title: "Delete Chat",
                    middleText: "Are you sure you want to delete this chat? ",
                    titlePadding: EdgeInsets.only(top: 10),
                    contentPadding: EdgeInsets.all(10),
                    confirm: TextButton(onPressed: () {
                      Get.back();
                    }, child: Text("OK")),
                    cancel: TextButton(onPressed: () {}, child: Text("Cancel"))
                  );
                },
              ),
              ListTile(
                title: Text("Shanto"),
                subtitle: Text("Get Dialog Alert"),
                tileColor: Colors.tealAccent,
                onTap: (){
                  Get.dialog(Material(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Light Theme"),
                            leading: Icon(Icons.light_mode),
                            onTap: (){
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            title: Text("Dark Theme"),
                            leading: Icon(Icons.dark_mode),
                            onTap: (){
                              Get.changeTheme(ThemeData.dark());
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    //Flutter Process 
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOne()));

                    //using get call an activity
                    Get.to(() => ScreenOne());
                  }, child: Text("Go to page=1")),
                  ElevatedButton(onPressed: () {
                    //using get
                    Get.to( () => ScreenTow());
                  }, child: Text("Go to Page=2")),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar(
          "Complete Project",
          "Do your wark now",
          icon: Icon(Icons.snowboarding_outlined),
          snackPosition: SnackPosition.BOTTOM,
          onTap: (snap){

          },
        );
      }),
    );
  }
}
