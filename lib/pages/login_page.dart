import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_service.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:provider/provider.dart';

import '../../themes/theme_provider.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // login method
  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
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
            Text("Food Delivery App",
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

            // login button
            MyButton(buttonText: "Login", onTap: () => login(context)
                // login(context),
                ),

            const SizedBox(height: 25),
            // register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15)),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text("Register now",
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
