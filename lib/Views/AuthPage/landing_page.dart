import 'package:auto_cart/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Config/router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 6),
            const Align(
              alignment: Alignment.centerRight,
              child: Image(
                image: AssetImage('assets/images/landing_page.png'),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(fontSize: 21, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Auto Cart',
                      style: TextStyle(
                          fontSize: 24,
                          color: kPurpleColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' - Your One-Stop Shop for All Things Automotive!',
                      style: TextStyle(fontSize: 21, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => router.go('/register'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPurpleColor,
                    foregroundColor: Colors.white),
                child: const Text('I am new here'),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text(
                'I have an account',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
