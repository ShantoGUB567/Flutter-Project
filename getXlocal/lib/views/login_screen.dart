import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_local/API_Photo/models/api_photo_screen.dart';
import 'package:getx_local/API_Practice/views/api_screen.dart';
import 'package:getx_local/controllers/login_controllers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginControllers controllers = Get.put(LoginControllers());

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            //Welcome msg
            Text(
              "Welcome to Softvance",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Login to your account",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 30),
        
            // Username
            TextField(
              controller: controllers.emailController.value,
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                prefixIcon: const Icon(Icons.person),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
        
            // Password
            TextField(
              controller: controllers.passwordController.value,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
        
            // Forget Password
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Forget Password Clicked!"),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 25),
        
            // Login Button
            ElevatedButton(
              onPressed: () {
                controllers.loginAPI();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 15),
        
            // Signup Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
        
            const SizedBox(height: 50),

            // API Screen buttons
            ElevatedButton(
              onPressed: () {
                Get.to(() => ApiScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              ),
              child: const Center(
                child: Text(
                  "API Practice",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),

            // API Photo Screen buttons
            ElevatedButton(
              onPressed: () {
                Get.to(() => ApiPhotoScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
              ),
              child: const Center(
                child: Text(
                  "Photo by API",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
