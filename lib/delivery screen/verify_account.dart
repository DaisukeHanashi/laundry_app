import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_app/delivery%20screen/delivery_signup.dart';
import 'delivery_bottom_bar.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  XFile? _frontImageDriverLicense;
  XFile? _frontImageVehicle;
  XFile? _backImage;
  bool isImagePickerActive = false;

  Future<void> _pickImageFromGallery(
      bool isDriverLicense, bool isFrontImage) async {
    if (isImagePickerActive) {
      return;
    }

    setState(() {
      isImagePickerActive = true;
    });

    try {
      final returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;

      setState(() {
        if (isDriverLicense) {
          if (isFrontImage) {
            _frontImageDriverLicense = returnedImage;
          } else {
            _frontImageVehicle = returnedImage;
          }
        } else {
          _backImage = returnedImage;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
    } finally {
      setState(() {
        isImagePickerActive = false;
      });
    }
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push( context, MaterialPageRoute(
                                      builder: (context) =>
                                          const DeliverySignup()),
                                );
                          },
                          child: const Icon(Icons.arrow_back_ios_new_outlined,
                              color: Colors.black),
                        ),
                     ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'LaundryMate',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF52CBBE),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Container(
                      height: 630,
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
                            const SizedBox(height: 15),
                            const Center(
                              child: Text(
                                'Verification',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Proof of Driver\'s License',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Front Side',
                                  style: TextStyle(
                                    fontFamily: 'Garet-Book',
                                    fontSize: 12,
                                    color: Colors.black38,
                                  ),
                                ),
                                SizedBox(width: 100),
                                Text(
                                  'Back Side',
                                  style: TextStyle(
                                    fontFamily: 'Garet-Book',
                                    fontSize: 12,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _frontImageDriverLicense != null
                                    ? Image.file(
                                        File(_frontImageDriverLicense!.path),
                                        height: 100,
                                        width: 150,
                                      )
                                    : GestureDetector(
                                        onTap: () => _pickImageFromGallery(true, true),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 130,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.grey.shade200,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text(
                                              'Pick Image',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                _frontImageVehicle != null
                                    ? Image.file(
                                        File(_frontImageVehicle!.path),
                                        height: 100,
                                        width: 150,
                                      )
                                    : GestureDetector(
                                        onTap: () => _pickImageFromGallery(true, false),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 130,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.grey.shade200,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text(
                                              'Pick Image',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            const Text(
                              'Proof of Vehicle and Plate Number',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Vehicle',
                              style: TextStyle(
                                fontFamily: 'Garet-Book',
                                fontSize: 12,
                                color: Colors.black38,
                              ),
                            ),
                            _backImage != null
                                ? Image.file(
                                    File(_backImage!.path),
                                    height: 100,
                                    width: 300,
                                  )
                                : GestureDetector(
                                    onTap: () => _pickImageFromGallery(false, true),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 280,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          'Pick Image',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 15),
                            const Text(
                              'Plate number',
                              style: TextStyle(
                                fontFamily: 'Garet-Book',
                                fontSize: 12,
                                color: Colors.black38,
                              ),
                            ),
                            _backImage != null
                                ? Image.file(
                                    File(_backImage!.path),
                                    height: 100,
                                    width: 300,
                                  )
                                : GestureDetector(
                                    onTap: () => _pickImageFromGallery(false, false),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 280,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          'Pick Image',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DeliveryBottomBar(),
                                  ),
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
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade400,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text:
                                        'By selecting Sign up, you agree to our ',
                                  ),
                                  TextSpan(
                                    text: 'Terms',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' and have Read and acknowledge our ',
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                      decoration: TextDecoration.underline,
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
            ],
          ),
        ),
      ),
    );
  }
}