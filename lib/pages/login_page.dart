import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seno_card/components/logic/storage_logic.dart';
import 'package:seno_card/pages/home_page.dart';
import 'package:seno_card/pages/pass_reset_page.dart';
import 'package:seno_card/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$',
      multiLine: true, dotAll: true);
  RegExp passRegex =
      RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$', multiLine: true, dotAll: true);
  final TextEditingController _passwordController = TextEditingController(),
      _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool password = false;
  bool loading = false;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    debugPrint(credential.toString());

    // Once signed in, return the UserCredential
    UserCredential credentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    debugPrint(credentials.toString());
    return credentials;
  }

  Future<void> signInFirebase() async {
    setState(() {
      loading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      if (!context.mounted) return;
      if (credential.user!.emailVerified) {
        StorageLogic().saveData(
            key: "user",
            value: jsonEncode({
              'email': _emailController.text,
              'password': _passwordController.text
            }),
            type: String);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        throw FirebaseAuthException(
            code: "email-not-verified", message: "Email belum diverifikasi");
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      late String err;
      switch (e.code) {
        case "INVALID_LOGIN_CREDENTIALS":
          err = "Email atau password kamu salah!";
          break;
        default:
          err = e.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          dismissDirection: DismissDirection.none,
          backgroundColor: Colors.redAccent,
          showCloseIcon: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          duration: const Duration(milliseconds: 2000),
          content: Text(err)));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          dismissDirection: DismissDirection.none,
          backgroundColor: Colors.redAccent,
          showCloseIcon: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          duration: const Duration(milliseconds: 2000),
          content: Text(e.toString())));
      debugPrint(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(241, 218, 244, 1),
            statusBarIconBrightness: Brightness.dark,
          ),
          foregroundColor: Colors.transparent,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width / 5,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Login ke Akunmu",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700, height: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Belum punya akun?",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          )),
                      child: const Text(
                        "Daftar >>",
                        style: TextStyle(fontSize: 12),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (emailRegex.hasMatch(value!)) {
                            return null;
                          }
                          return "Masukkan email dengan benar!";
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Masukkan email kamu",
                          label: Card(
                            color: Color.fromRGBO(247, 233, 248, 1),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (passRegex.hasMatch(value!)) {
                            return null;
                          }
                          return "Password minimal 8 karakter, 1 huruf besar & 1 angka";
                        },
                        obscureText: password,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          suffixIconColor:
                              const Color.fromRGBO(177, 121, 184, 1),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() {
                              password = !password;
                            }),
                            child: Icon(
                                !password
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 25),
                          ),
                          hintText: "Masukkan password kamu",
                          label: const Card(
                            color: Color.fromRGBO(247, 233, 248, 1),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PassResetPage()));
                  },
                  child: Text(
                    "Lupa Password?",
                    style: TextStyle(color: Colors.amber.shade800),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                child: TextButton(
                  onPressed: loading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            signInFirebase();
                          }
                        },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      fixedSize: const MaterialStatePropertyAll(
                          Size(double.maxFinite, double.minPositive)),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(142, 97, 147, 1))),
                  child: loading
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Login"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text(
                    "Atau masuk dengan",
                    style: TextStyle(fontSize: 12),
                  ),
                  Expanded(child: Divider()),
                ]),
              ),
              SizedBox(
                height: 45,
                child: TextButton.icon(
                  onPressed: () {
                    signInWithGoogle();
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
                    fixedSize: const MaterialStatePropertyAll(
                        Size(double.maxFinite, double.minPositive)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                  ),
                  label: const Text("Google"),
                  icon: Image.asset(
                    "assets/images/google-logo.png",
                    height: 18,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
