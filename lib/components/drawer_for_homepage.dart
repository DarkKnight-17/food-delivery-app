import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_service.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final authService = AuthService();
  void logout() {
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = authService.getCurrentUser();
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // logo
              Column(
                children: [
                  DrawerHeader(
                      child: Center(
                          child: Icon(
                    Icons.lock_open_rounded,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 80,
                  ))),

                  Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        title: Text(currentUser!.email!),
                        subtitle: const Text('User email'),
                        leading: const Icon(Icons.person),
                      )),
                  // home list tile
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        title: const Text("H O M E"),
                        leading: const Icon(Icons.home),
                        onTap: () {
                          // close drawer
                          Navigator.pop(context);
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        title: const Text("S E T T I N G S"),
                        leading: const Icon(Icons.settings),
                        onTap: () {
                          // close drawer
                          Navigator.pop(context);

                          // open settings screen

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ));
                        },
                      )),
                ],
              ),
              //
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: ListTile(
                    title: const Text("L O G O U T"),
                    leading: const Icon(Icons.logout),
                    onTap: logout,
                  )),
            ]));
  }
}
