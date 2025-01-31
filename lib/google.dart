import 'package:flutter/material.dart';
// ignore: unused_import
import "home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset('images/logo.png'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                ),
              ),
            ),
            const Spacer(),
            AccountSelectionModal(),
          ],
        ),
      ),
    );
  }
}

class AccountSelectionModal extends StatelessWidget {
  AccountSelectionModal({super.key});

  final List<Map<String, String>> accounts = [
    {
      'name': 'Jones, James',
      'email': 'jones@gmail.com',
      'avatar':
          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/With%20Google%20-%20Login-Zu3YEDjuo4Rf7NXZl5CvAn7RH044Ov.png'
    },
    {
      'name': 'Patrick Miller',
      'email': 'patrickmiller@gmail.com',
      'avatar':
          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/With%20Google%20-%20Login-Zu3YEDjuo4Rf7NXZl5CvAn7RH044Ov.png'
    },
    {
      'name': 'Sandra Jennifer Olivia',
      'email': 'OliviaSandra@gmail.com',
      'avatar':
          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/With%20Google%20-%20Login-Zu3YEDjuo4Rf7NXZl5CvAn7RH044Ov.png'
    },
    {
      'name': 'Quincy Albert',
      'email': 'AQuincy@gmail.com',
      'avatar':
          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/With%20Google%20-%20Login-Zu3YEDjuo4Rf7NXZl5CvAn7RH044Ov.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Choose an account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'to continue to Velora',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          ...accounts.map((account) => AccountListItem(
                name: account['name']!,
                email: account['email']!,
              )),
          const Divider(),
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: const Icon(Icons.person_add, color: Colors.grey),
            ),
            title: const Text(
              'Add another account',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'To continue, Google will share your name, email address, and profile picture with Velora. Before using this app, review its privacy policy and terms of service.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  final String name;
  final String email;

  const AccountListItem({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        email,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      onTap: () {},
    );
  }
}
