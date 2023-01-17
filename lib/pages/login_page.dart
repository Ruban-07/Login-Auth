import 'package:crud/components/my_button.dart';
import 'package:crud/components/my_textFields.dart';
import 'package:crud/components/square_tile.dart';
import 'package:crud/const/app_const.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

// sign user
  void signUserIn() {}
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
                  controller: userNameController,
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
                    const SquareTile(
                      imagePath: AppConst.googleImage,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.025,
                    ),
                    // Apple Button
                    const SquareTile(
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
                    Text(
                      AppConst.regNow[1],
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
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
