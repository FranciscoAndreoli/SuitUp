import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/mybutton.dart';
import 'components/mytextfield.dart';
import 'components/square_Tile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    // show loading circle

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email Incorrecto'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Contraseña Incorrecta'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 40),

            // logo
            const Icon(
              Icons.tornado,
              size: 100,
            ),

            const SizedBox(height: 30),
            // welcome back, you've been missed!

            const Text(
              'Bienvenido, ¡te extrañamos!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 8),

            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 10),

            //forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // sign in button
            MyButton(
              onTap: signUserIn,
            ),

            const SizedBox(height: 35),
            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
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

            const SizedBox(height: 25),

            // google + apple sign in buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //google button
                SquareTile(imagePath: 'lib/images/googleLogo.png'),
                SizedBox(width: 10),
                //apple button
                SquareTile(imagePath: 'lib/images/appleLogo.png'),
              ],
            ),

            const SizedBox(height: 25),
            // not a member? register now

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Row(
                children: [
                  Text(
                    '¿No estas registrado?',
                    style: TextStyle(color: Color(0xFF616161)),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Registrate aquí.',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
