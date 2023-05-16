import 'package:flutter/material.dart';
import 'components/mybutton.dart';
import 'components/mytextfield.dart';
import 'components/square_Tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(children: [
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

            // username textfield
            MyTextField(
              controller: usernameController,
              hintText: 'Usuario',
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
