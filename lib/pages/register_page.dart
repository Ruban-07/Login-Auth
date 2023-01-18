import 'package:crud/components/my_button.dart';
import 'package:crud/components/my_textFields.dart';
import 'package:crud/components/square_tile.dart';
import 'package:crud/const/app_const.dart';
import 'package:crud/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// sign user up method
  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try creating user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error: 'password don't match'
        showErrorMessage("Password don't match!");
      }
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
                  height: screenSize.height * 0.005,
                ),

                //Logo
                Icon(
                  Icons.lock,
                  size: screenSize.width * 0.18,
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),

                //Let's create an account for you
                Text(
                  'Let\'s create an account for you!',
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

                //Confirm Password Textfield
                MyTextFields(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                SizedBox(
                  height: screenSize.height * 0.031,
                ),

                //Sign In Button
                MyButton(
                  onTap: signUserUp,
                  buttonText: 'Sign Up',
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
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: AppConst.googleImage,
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
                      AppConst.regNow[2],
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
                        AppConst.regNow[3],
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
