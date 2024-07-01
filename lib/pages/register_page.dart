import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_service.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // login method
  void register(BuildContext context) async {
    final authService = AuthService();

    if (_confirmPasswordController.text == _passwordController.text) {
      try {
        authService.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (err) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(err.toString())));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords don't match"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // welcome back message
            Text("Let's create an account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                )),

            const SizedBox(height: 25),
            // email textfield
            MyTextField(
              hintColor: (isDarkMode ? Colors.white : Colors.grey),
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 25),
            //password textfield
            MyTextField(
                hintColor: (isDarkMode ? Colors.white : Colors.grey),
                hintText: "Password",
                obscureText: true,
                controller: _passwordController),

            const SizedBox(height: 25),

            MyTextField(
                hintColor: (isDarkMode ? Colors.white : Colors.grey),
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController),

            const SizedBox(height: 25),
            // register button
            MyButton(
              buttonText: "Sign Up",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),
            // register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a member? ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15)),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text("Login now",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
