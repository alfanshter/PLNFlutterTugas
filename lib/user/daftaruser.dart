import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/user/menuuser.dart';

void main() {
  runApp(DaftarUser());
}

class DaftarUser extends StatelessWidget {
  static const nameRoute = '/daftaruser';
  final edtNama = TextEditingController();
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();
  final authC = Get.find<AuthController>();
  FirebaseDatabase database = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Daftar Sebagai Admin"),
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
                controller: edtNama,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    fillColor: Colors.black,
                    hintText: 'Nama',
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
                style: TextStyle(color: Colors.white),
                controller: edtEmail,
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
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                controller: edtPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    fillColor: Colors.black,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[600])),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 123,
              height: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF43AA6C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    if(edtEmail.text.isNotEmpty && edtPassword.text.isNotEmpty && edtNama.text.isNotEmpty){
                      authC
                          .signup(
                          email: edtEmail.text,
                          password: edtPassword.text,
                          nama: edtNama.text)
                          .then((value) {
                        if (value == "weak-password") {
                          Get.snackbar("Auth", "Weak Password",backgroundColor: Colors.white);
                        } else if (value == "email-already-in-use") {
                          Get.snackbar("Auth", "email-already-in-use",backgroundColor: Colors.white);
                        } else if (value == 1) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              MenuUser.nameRoute, (route) => false);
                        }
                      });
                    }else {
                      Get.snackbar("Auth", "Jangan kosongi kolom",backgroundColor: Colors.white);

                    }

                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins-regular",
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
