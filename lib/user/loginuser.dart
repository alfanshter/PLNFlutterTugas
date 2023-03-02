
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/user/daftaruser.dart';
import 'package:plnfix/user/menuuser.dart';
void main() {
  runApp(LoginUser());
}

class LoginUser extends StatelessWidget {
  final edtemail = TextEditingController();
  final edtpassword = TextEditingController();
  final authC = Get.find<AuthController>();
  static const nameRoute = '/loginuser';

  Future role() async {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    final DatabaseReference ref = FirebaseDatabase.instance.ref("/");
    User? user = FirebaseAuth.instance.currentUser;

    if (user?.uid != null) {
      var uid = user?.uid;
      final getprofil = await ref.child("users/$uid").get();
      var role = getprofil.child('role').value;
      if (role == 0) {
        //admin
        return 0;
      } else if (role == 1) {
        //user
        return 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Halaman Masuk Pengguna"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0x9943AA6C),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset("images/iconheader.png"),
            SizedBox(
              height: 61,
            ),
            Container(
              width: 244,
              height: 65,
              child: TextField(
                controller: edtemail,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    fillColor: Colors.black,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey[600])),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              width: 244,
              height: 65,
              child: TextField(
                controller: edtpassword,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    fillColor: Colors.black,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[600])),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              width: 123,
              height: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF43AA6C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    authC.login(edtemail.text, edtpassword.text).then((value) {
                      if (value == 'user-not-found') {
                        Get.snackbar('Auth', 'Akun belum ada');
                      } else if (value == 'wrong-password') {
                        Get.snackbar('Auth', 'password salah');
                      } else if (value == 'Jangan kosongi email dan password') {
                        Get.snackbar(
                            'Auth', 'Jangan kosongi email dan password');
                      } else if (value == 'invalid-email') {
                        Get.snackbar('Auth', 'email salah');
                      } else if (value == 1) {
                        role().then((value) {
                          if (value == 0) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                MenuAdmin.nameRoute, (route) => false);
                          } else if (value == 1) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                MenuUser.nameRoute, (route) => false);
                          }
                        });
                      }
                    });
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins-regular",
                        color: Colors.white),
                  )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                width: double.infinity,
                color: Colors.white,
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DaftarUser.nameRoute);
                    },
                    child: Text(
                      "Daftar sebagai pengguna",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "poppins-regular",
                          color: Colors.black),
                    ))),
          ],
        ),
      ),
    );
  }
}
