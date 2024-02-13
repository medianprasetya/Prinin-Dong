import 'package:flutter/material.dart';
import '../home/splashscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.facebook, size: 80, color: Colors.blue),
            const SizedBox(
              height: 30,
            ),
            TextField(
              style: TextStyle(
                  // fontSize: MediaQuery.of(context).size.height * 0.013,
                  fontSize: MediaQuery.of(context).size.width > 200 ? 15 : 15),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(
                  // fontSize: MediaQuery.of(context).size.height * 0.013,
                  fontSize: MediaQuery.of(context).size.width > 200 ? 15 : 15),
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;

                if (email.isNotEmpty && password.isNotEmpty) {
                  // Lakukan tindakan login
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email dan password harus diisi'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                    // fontSize: MediaQuery.of(context).size.height * 0.013,
                    fontSize:
                        MediaQuery.of(context).size.width > 200 ? 15 : 15),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SplashScreen.routeName);
              },
              child: Text(
                'Register',
                style: TextStyle(
                    // fontSize: MediaQuery.of(context).size.height * 0.013,
                    fontSize:
                        MediaQuery.of(context).size.width > 200 ? 15 : 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
