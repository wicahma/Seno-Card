import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/micros/back_button.dart';
import 'package:seno_card/components/micros/clipper_profile.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _profile = false, password = false, rePassword = false;
  List<String> list = <String>['Laki laki', 'Perempuan'];

  final TextEditingController _namaController = TextEditingController(),
      _noHpController = TextEditingController(),
      _genderController = TextEditingController(),
      _birthDateController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      useAppBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const BackBtn(),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(20, 20))),
        title: Text(
          'profil'.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(177, 121, 184, 1)),
        ),
        centerTitle: true,
      ),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          left: 155,
                          bottom: 0,
                          child: ClipPath(
                            clipper: ClipperRight(),
                            child: const SizedBox(
                              width: 27,
                              height: 27,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                          right: 130,
                          bottom: -10,
                          child: ClipPath(
                            clipper: ClipperLeft(),
                            clipBehavior: Clip.antiAlias,
                            child: const SizedBox(
                              width: 27,
                              height: 47,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                      Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(left: 25),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45))),
                        child: Container(
                          width: 110,
                          height: 110,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(38, 88, 139, 1),
                            borderRadius: BorderRadius.circular(36),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: _profile
                              ? const Image(
                                  image: NetworkImage(
                                      "https://randomuser.me/api/portraits/men/75.jpg"),
                                )
                              : const Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                  size: 100,
                                ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: IconButton(
                                padding: const EdgeInsets.all(1),
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.black.withOpacity(0.8)),
                                  elevation:
                                      MaterialStateProperty.all<double>(5),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color.fromRGBO(38, 88, 139, 1)),
                                ),
                                focusColor:
                                    const Color.fromARGB(255, 87, 158, 228),
                                hoverColor:
                                    const Color.fromARGB(255, 87, 158, 228),
                                splashColor:
                                    const Color.fromARGB(255, 87, 158, 228),
                                highlightColor:
                                    const Color.fromARGB(255, 87, 158, 228),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  size: 15,
                                  color: Colors.white,
                                )),
                          ))
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Pengguna",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Card(
                        color: Color.fromRGBO(255, 195, 73, 1),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child: Text(
                            "@idnya",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: ListView(
                    children: [
                      const Text(
                        "Data Pengguna",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _namaController,
                        decoration: const InputDecoration(
                          hintText: "Masukkan nama kalian",
                          label: Card(
                            color: Color.fromRGBO(247, 233, 248, 1),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                "Nama Panggilan",
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
                        width: 10,
                        height: 10,
                      ),
                      TextField(
                        controller: _noHpController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: "Masukkan nomor kalian",
                          helperText: "Awali dengan 08",
                          label: Card(
                            color: Color.fromRGBO(247, 233, 248, 1),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                "Nomor Handphone",
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
                        width: 10,
                        height: 10,
                      ),
                      Row(
                        children: [
                          DropdownMenu(
                            controller: _genderController,
                            dropdownMenuEntries: list
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                            inputDecorationTheme: const InputDecorationTheme(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                            menuStyle: MenuStyle(
                                surfaceTintColor:
                                    const MaterialStatePropertyAll(
                                        Colors.white),
                                elevation: const MaterialStatePropertyAll(5),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                            label: const Card(
                              color: Color.fromRGBO(247, 233, 248, 1),
                              elevation: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                child: Text(
                                  "Jenis Kelamin",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Flexible(
                            child: TextField(
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2015, 8),
                                    lastDate: DateTime(2101));
                                if (picked == null || picked == DateTime.now())
                                  return;

                                setState(() {
                                  _birthDateController.value = TextEditingValue(
                                      text: DateFormat('dd/MM/yy')
                                          .format(picked)
                                          .toString());
                                });

                                // Ubah format tanggal
                                debugPrint(
                                    "Tanggalhnyaaa : ${picked.toString()}");
                              },
                              controller: _birthDateController,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                hintText: "12/12/12",
                                suffixIconColor:
                                    Color.fromRGBO(177, 121, 184, 1),
                                suffixIcon: Icon(Icons.calendar_month_rounded),
                                label: Card(
                                  color: Color.fromRGBO(247, 233, 248, 1),
                                  elevation: 0,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    child: Text(
                                      "Tanggal Lahir",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)))),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(255, 195, 73, 1)),
                              ),
                              child: const Row(
                                children: [
                                  Text("Simpan"),
                                  SizedBox(width: 5),
                                  Icon(Icons.save_rounded)
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Ganti Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
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
                          hintText: "Masukkan password",
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
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: rePassword,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          suffixIconColor:
                              const Color.fromRGBO(177, 121, 184, 1),
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() {
                              rePassword = !rePassword;
                            }),
                            child: Icon(
                                !rePassword
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 25),
                          ),
                          hintText: "Masukkan ulang password",
                          label: const Card(
                            color: Color.fromRGBO(247, 233, 248, 1),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Text(
                                "Konfirmasi Password",
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)))),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(255, 195, 73, 1)),
                              ),
                              child: const Row(
                                children: [
                                  Text("Ganti Password"),
                                  SizedBox(width: 5),
                                  Icon(Icons.key_rounded)
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Pengaturan akun",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        onTap: null,
                        splashColor: Colors.grey.shade900,
                        leading: const Icon(Icons.account_circle),
                        title: const Text("Akun terhubung"),
                        trailing: Card(
                          elevation: 0,
                          color: Colors.orangeAccent.shade100,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            child: Text(
                              "email",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          return;
                        },
                        iconColor: Colors.red,
                        textColor: Colors.red,
                        leading: const Icon(Icons.logout_rounded),
                        title: const Text("Logout akun"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
