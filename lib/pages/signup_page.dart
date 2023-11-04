import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seno_card/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$',
      multiLine: true, dotAll: true);
  RegExp passRegex =
      RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$', multiLine: true, dotAll: true);
  bool password = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> signUpFirebase() async {
    setState(() {
      loading = true;
    });
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      );
      credential.user!.sendEmailVerification();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          dismissDirection: DismissDirection.none,
          backgroundColor: Colors.green.shade500,
          showCloseIcon: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          duration: const Duration(milliseconds: 2000),
          content: const Text(
              "Account Sucesfully Created! Please Verify the email!")));
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          dismissDirection: DismissDirection.none,
          backgroundColor: Colors.redAccent,
          showCloseIcon: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          duration: const Duration(milliseconds: 2000),
          content: Text(e.message!)));
    } catch (e) {
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
        scrolledUnderElevation: 0,
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width / 5,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Daftar Akun Baru",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, height: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sudah punya akun?",
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )),
                    child: const Text(
                      "Login >>",
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
                      controller: _passController,
                      decoration: InputDecoration(
                        suffixIconColor: const Color.fromRGBO(177, 121, 184, 1),
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
              height: 45,
            ),
            SizedBox(
              height: 45,
              child: TextButton(
                onPressed: loading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          signUpFirebase();
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
                    : const Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
