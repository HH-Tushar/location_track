import 'package:flutter/material.dart';
import 'package:location_track/presentation/admin/admin_home_view.dart';
import 'package:location_track/presentation/employee/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../../data/auth_provider.dart';
import '../../common/nav.dart';

class AdminLoginInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AdminLoginInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthenticationProvider authProvider = context.watch();
    String email = "";
    String password = "";

    void login() async {
      final feedback = await authProvider.signIn(email, password,true);
      if (feedback == true && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login sccessfull with $email')),
        );
        navigateReplaceTo(context: context, widget: const AdminHomeView());
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed with $email')),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(
                    "assets/logo.png",
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onFieldSubmitted: (value) => email = value,
                          onChanged: (value) => email = value,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Color(0xFFF5FCF9),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (phone) {
                            // Save it
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFormField(
                            obscureText: true,
                            onFieldSubmitted: (value) => password = value,
                            onChanged: (value) => password = value,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: Color(0xFFF5FCF9),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            onSaved: (passaword) {
                              // Save it
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Navigate to the main screen
                              login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF00BF6D),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign in"),
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.64),
                                ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     navigateReplaceTo(
                        //         context: context, widget: RegisterScreen());
                        //   },
                        //   child: Text.rich(
                        //     const TextSpan(
                        //       text: "Don’t have an account? ",
                        //       children: [
                        //         TextSpan(
                        //           text: "Sign Up",
                        //           style: TextStyle(color: Color(0xFF00BF6D)),
                        //         ),
                        //       ],
                        //     ),
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyMedium!
                        //         .copyWith(
                        //           color: Theme.of(context)
                        //               .textTheme
                        //               .bodyLarge!
                        //               .color!
                        //               .withOpacity(0.64),
                        //         ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
