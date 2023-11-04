import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seno_card/pages/login_page.dart';
import 'package:seno_card/pages/signup_page.dart';

class PassResetPage extends StatefulWidget {
  const PassResetPage({super.key});

  @override
  State<PassResetPage> createState() => _PassResetPageState();
}

class _PassResetPageState extends State<PassResetPage> {
  final _emailController = TextEditingController();
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$',
      multiLine: true, dotAll: true);
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> sendResetFirebase() async {
    setState(() {
      loading = true;
    });
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.none,
        backgroundColor: Colors.green.shade500,
        showCloseIcon: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        duration: const Duration(milliseconds: 2000),
        content: const Text("Please check your email!")));
    setState(() {
      loading = false;
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
                "Pulihkan Akun Anda",
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
                  child: TextFormField(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 45,
                child: TextButton(
                  onPressed: loading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            sendResetFirebase();
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
                      : const Text("Kirim email"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text(
                    " Atau ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Expanded(child: Divider()),
                ]),
              ),
              SizedBox(
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ));
  }
}
