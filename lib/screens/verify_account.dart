import 'dart:io';
import 'package:flutter/material.dart';
import 'package:laundry_app/widget/bottom_bar.dart';
import 'package:image_picker/image_picker.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  XFile? _image;

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _image = returnedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFF52FFC1), Color(0xFF25D3F9)],
              stops: [0.3, 0.7, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
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
                const SizedBox(height: 130),
                Container(
                  height: 500,
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
                          'Valid Government ID',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(
                          width: 280,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Front Side',
                        style: TextStyle(fontFamily: 'Garet-Book',
                        fontSize: 12,
                        color: Colors.black38
                        )
                        ),
                        _image != null
                            ? Image.file(
                                File(_image!.path),
                                height: 100,
                                width: 300,
                              )
                            : GestureDetector(
                                onTap: _pickImageFromGallery,
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
                        const Text('Back Side',
                        style: TextStyle(fontFamily: 'Garet-Book',
                        fontSize: 12,
                        color: Colors.black38
                        )
                        ),
                        _image != null
                            ? Image.file(
                                File(_image!.path),
                                height: 100,
                                width: 300,
                              )
                            : GestureDetector(
                                onTap: _pickImageFromGallery,
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
                                  builder: (context) => const BottomBar()),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
