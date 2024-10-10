import 'package:flutter/material.dart';
import 'package:t2_2021110055/screens/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        color: const Color.fromARGB(255, 224, 242, 228), // Background warna hijau muda
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              
              const Text(
                'Welcome to Vegetables Order App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 116, 13),
                ),
              ),
              const SizedBox(height: 20), // Spacer for better layout
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                
                child: const Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 98, 134, 100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
