import 'package:crud/components/my_button.dart';
import 'package:crud/components/my_textFields.dart';
import 'package:crud/components/square_tile.dart';
import 'package:crud/const/app_const.dart';
import 'package:crud/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

// sign user
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // show error message
      showErrorMessage(e.code);
    }
  }

// wrror message to user
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.error,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: screenSize.height * 0.01,
                ),

                //Logo
                Icon(
                  Icons.lock,
                  size: screenSize.width * 0.25,
                ),
                SizedBox(
                  height: screenSize.height * 0.06,
                ),

                //Welcome Message
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: screenSize.width * 0.041,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.031,
                ),

                //Username Textfield
                MyTextFields(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                SizedBox(
                  height: screenSize.height * 0.011,
                ),

                //Password Textfield
                MyTextFields(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(
                  height: screenSize.height * 0.011,
                ),

                //Forget Password?
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.063,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.031,
                ),

                //Sign In Button
                MyButton(
                  onTap: signUserIn,
                  buttonText: 'Sign In',
                ),
                SizedBox(
                  height: screenSize.height * 0.061,
                ),

                //Or Continue With
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.063,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.025,
                        ),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.061,
                ),

                //Google + Apple Sign In Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Button
                    SquareTile(
                      imagePath: AppConst.googleImage,
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.025,
                    ),
                    // Apple Button
                    SquareTile(
                      onTap: () {},
                      imagePath: AppConst.appleImage,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.036,
                ),

                //Not a Member? Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConst.regNow[0],
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        AppConst.regNow[1],
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
