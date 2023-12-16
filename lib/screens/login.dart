import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/screens/home.dart';
import '../utils/hive_crud.dart';
import '../utils/user_model.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {

 Login({Key? key,})
      : super(key: key);

@override
_LoginState createState() => _LoginState(); 

}

class _LoginState extends State<Login> {
  late String email; 
  late String password; 
  TextEditingController emailController =  TextEditingController(); 
  TextEditingController passwordController = TextEditingController();

 
  UserModel findUser(List<UserModel> userList, String email, String password) {
    for (var user in userList) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return UserModel(
      user_id: '123',
      name: 'Guest',
      email: email,
      phoneNumber: '',
      password: password,
    );
  }

  void updateEmail(String value) {
    setState(() {
      email = value; // Update the email variable when the text changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color.fromARGB(255, 46, 143, 107)],
              stops: [0.35, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Garet-Book',
                          fontSize: 30,
                          color: Color(0xFF52CBBE),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Hello, welcome back!',
                      style: TextStyle(
                        fontFamily: 'Garet-Book',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Container(
                      height: 450,
                      width: 325,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            // const Text(
                            //   'Email',
                            //   style: TextStyle(
                            //     fontFamily: 'Garet-Book',
                            //     fontSize: 15,
                            //     color: Colors.black,
                            //   ),
                            // ),
                            const SizedBox(height: 5),
                             SizedBox(
                              width: 280,
                              height: 40,
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                             const SizedBox(height: 20),
                            // const Text(
                            //   'Password',
                            //   style: TextStyle(
                            //     fontFamily: 'Garet-Book',
                            //     fontSize: 15,
                            //     color: Colors.black,
                            //   ),
                            // ),
                            const SizedBox(height: 5),
                             SizedBox(
                              width: 280,
                              height: 40,
                              child: PasswordField(
                               controller: passwordController,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        fontFamily: 'Garet-Book',
                                        color: Color(0xFF52CBBE),
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () async {
                                final userList = await HiveCRUD.getUsers();

                                final user =
                                    findUser(userList, emailController.text, passwordController.text);

                                if (user.name == 'Guest') {
                                  // Show invalid access dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Invalid Access'),
                                        content: Text(
                                            'Invalid email or password. Please try again.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  // Proceed with navigating to Home
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(
                                        user: user,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 280,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF0E5C46),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Garet-Book',
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Center(
                              child: Text(
                                'or sign up using',
                                style: TextStyle(
                                  fontFamily: 'Garet-Book',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildSocialButton(
                                    'Google', 'assets/google_logo.png'),
                                const SizedBox(width: 10),
                                buildSocialButton(
                                    'Facebook', 'assets/facebook_logo.png'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: "Don't have an account? "),
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: const TextStyle(
                                        fontFamily: 'Garet-Book',
                                        fontSize: 14,
                                        color: Color(0xFF52CBBE),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUp()),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton(String text, String imagePath) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}