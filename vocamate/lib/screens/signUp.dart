import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/screens/signIn.dart';
import 'package:vocamate/models/userModel.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? selectedNative;
  String? selectedTarget;

  @override
  Widget build(BuildContext context) {
    HandleSignUp(String email, String password) async {
      if (_formkey.currentState!.validate()) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          try {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential.user!.uid)
                .set({
                  'username': usernameController.text,
                  'avatar': null,
                  'email': emailController.text,
                  'targetlang': selectedTarget.toString(),
                  'nativelang': selectedNative.toString(),
                  'level': 1,
                  'coin': 0,
                  'streak': 0,
                });
          } on FirebaseException catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(e.toString())));
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Sign Up success!")));
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [themecolor_pink, themecolor_blue, themecolor_mint],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(rect);
          },
          child: Text(
            'VOCAMATE',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        colors: [themecolor_blue, themecolor_pink],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(rect);
                    },
                    child: Text(
                      'Create \nAccount',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'username',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User name can not be emty!";
                      } else if (value.contains(" ")) {
                        return "User name do not contain any spaces";
                      } else if(value.length >20){
                        return "User name can not longer than 20 characters";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'email',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can not be emty!";
                      } else if (!value.contains('@') ||
                          !value.contains('.') ||
                          value.contains(RegExp(r'[A-Z]')) ||
                          value.contains(" ")) {
                        return "Incorrect email format";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Password can not be emty!";
                      else if (value.contains(" ") ||
                          value.length > 16 ||
                          value.length < 6)
                        return 'Password must have 5-16 characters and do not\n contain any spaces';
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: confirmpasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'confirm password',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Confirm password can not be emty!";
                      else if (value != passwordController.text)
                        return "Confirm password does not match";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'native language',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    value: selectedNative,
                    dropdownColor: Color.fromRGBO(226, 226, 226, 1),
                    borderRadius: BorderRadius.circular(16),
                    items: [
                      DropdownMenuItem(child: Text("English"), value: "en"),
                      DropdownMenuItem(child: Text("Vietnamese"), value: "vi"),
                      DropdownMenuItem(child: Text("Korean"), value: "ko"),
                    ],
                    onChanged: (newvalue) {
                      setState(() {
                        selectedNative = newvalue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Native language can not be emty!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'target language',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    value: selectedTarget,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    dropdownColor: Color.fromRGBO(226, 226, 226, 1),
                    borderRadius: BorderRadius.circular(16),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "English",
                          style: TextStyle(
                          ),
                        ),
                        value: "en",
                      ),
                      DropdownMenuItem(child: Text("Vietnamese"), value: "vi"),
                      DropdownMenuItem(child: Text("Korean"), value: "ko"),
                    ],
                    onChanged: (newvalue) {
                      setState(() {
                        selectedTarget = newvalue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Target language can not be null";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [themecolor_blue, themecolor_pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextButton(
                          onPressed: () {
                            HandleSignUp(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You already have account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
