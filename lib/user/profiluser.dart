import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/pilihuser.dart';
void main() {
  runApp(ProfilUser());
}

class ProfilUser extends StatefulWidget {
  @override
  State<ProfilUser> createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  final authC = Get.find<AuthController>();
  final databaseRef = FirebaseDatabase.instance;
  var ref = FirebaseDatabase.instance;
  FirebaseAuth auth = FirebaseAuth.instance;


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
    var uid = auth.currentUser?.uid;
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("users/$uid");

    Get.find<AuthController>().profil().then((value) {});
    // final getprofil = await ref.child("users/$uid").get();
    // nama = getprofil.child('nama').value.toString();
    // var email = getprofil.child('email').value;
    // var password = getprofil.child('password').value;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Profil"),
        ),
        body: StreamBuilder(
          stream: _dbref.onValue,
          builder: (context, snapshot) {
            var nama = snapshot.data?.snapshot.child('nama').value;
            var password = snapshot.data?.snapshot.child('password').value;
            var email = snapshot.data?.snapshot.child('email').value;

            return Container(
              alignment: Alignment.center,
              color: Color(0x9943AA6C),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Image.asset("images/profil_rounded.png"),
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              width: 213,
                              height: 65,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  email.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                      width: 244,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          nama.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                      width: 244,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          password.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 97,
                    height: 75,
                    child: IconButton(
                        onPressed: () {
                          authC.logout().then((value) {
                            print(value);
                            if (value == 1) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  PilihUser.nameRoute, (route) => false);
                            } else {
                              Get.snackbar('Auth', 'Silahkan coba lagi');
                            }
                          });
                        },
                        icon: Image.asset("images/btnlogout.png")),
                  ),
                  Text(
                    "KELUAR ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            );
          },
        ));
  }

  _getdata() async {
    Object data;
    Get.find<AuthController>().profil().then((value) {
      data = value;
    });
  }
}
