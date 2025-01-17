import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/user_model.dart';
import 'enable.dart';


class VerifyMobile extends StatelessWidget {
  final UserModel user; 
  const VerifyMobile ({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color.fromARGB(255, 46, 143, 107)],
              stops: [0.35, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
        ),
        child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LaundryMate',
                    style: TextStyle(
                      fontFamily: 'Garet-Book',
                      fontSize: 30,
                      color: Color(0xFF52CBBE),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    height: 440,
                    width: 325,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15),
                          const Text(
                            'Please Verify your Number',
                            style: TextStyle(
                              fontFamily: 'Garet-Book',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: SvgPicture.asset(
                              'assets/svg/email.svg',
                              height: 50,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(left:15, right: 10),
                            child: Center(
                              child: Text(
                                'A verification code has been sent to +639****622',
                                style: TextStyle(
                                  fontFamily: 'Garet-Book',
                                  fontSize: 15,
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Padding(
                            padding: EdgeInsets.only(left:15, right: 10),
                            child: Center(
                              child: Text(
                                'Please check your inbox and enter the verification code below to verify your number. The code will expire in 45s.',
                                style: TextStyle(
                                  fontFamily: 'Garet-Book',
                                  fontSize: 13,
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.only(left:10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40, 
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 40, 
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 40, 
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 40, 
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 40, 
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 40, 
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TwoFactorAuthenticationSetup(user: user)),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 280,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFF0E5C46),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Verify',
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
                          const Padding(
                            padding: EdgeInsets.only(left:15, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Resend Code',
                                style: TextStyle(
                                  fontFamily: 'Garet-Book',
                                  fontSize: 14,
                                  color: Color(0xFF737373), 
                                ),
                                ),
                              ],
                            ),
                          )
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
    );
  }
}
