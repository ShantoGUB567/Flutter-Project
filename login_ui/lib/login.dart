import 'package:flutter/material.dart';
import 'package:login_ui/signup.dart';
import 'package:login_ui/toggle.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/theme_provider.dart';
import 'package:login_ui/toggle.dart';

class Login_Activity extends StatefulWidget {
  const Login_Activity({super.key});

  @override
  State<Login_Activity> createState() => _Login_ActivityState();
}

class _Login_ActivityState extends State<Login_Activity> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: const [
          //Toggle Icon
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ToggleActivity(), // Single icon toggle
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //Logo
                Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                ),
                const SizedBox(height: 30),

                //Welcome msg
                Text(
                  "Welcome to Zensoft",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
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
                  decoration: InputDecoration(
                    hintText: "Username",
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Login button clicked!"),
                      ),
                    );
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (Context) => SignupActivity()));
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text("Sign Up Clicked!"),
                        //   ),
                        // );
                      },
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

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
