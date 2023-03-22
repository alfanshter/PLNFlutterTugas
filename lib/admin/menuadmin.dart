import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/informasiadmin.dart';
import 'package:plnfix/admin/masukandata.dart';
import 'package:plnfix/admin/pelaporanadmin.dart';

void main() {
  runApp(MenuAdmin());
}

class MenuAdmin extends StatelessWidget {
  static const nameRoute = '/menuadmin';
  @override
  Widget build(BuildContext context) {
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("informasi");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('Menu Admin'),
        ),
        body: StreamBuilder(
          stream: _dbref.onValue,
          builder: (context, snapshot) {
            var alamat =
                snapshot.data?.snapshot.child('alamat').value.toString();
            var jangkawaktu =
                snapshot.data?.snapshot.child('jangkawaktu').value.toString();
            var penyebab =
                snapshot.data?.snapshot.child('penyebab').value.toString();

            return Container(
              alignment: Alignment.center,
              color: Color(0x9943AA6C),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Selamat Datang ',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "poppins-regular",
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset("images/iconheader.png"),
                  Text(
                    'Blackout Information',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins-regular",
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 97,
                    height: 75,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profiluser');
                        },
                        icon: Image.asset("images/btnprofil.png")),
                  ),
                  Text(
                    'AKUN',
                    style: TextStyle(
                        fontFamily: "poppins-regular",
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 97,
                    height: 75,
                    child: IconButton(
                        onPressed: () {
                          if (snapshot.data?.snapshot.exists == true) {
                            Navigator.of(context)
                                .pushNamed(InformasiAdmin.nameRoute);
                          } else {
                            Navigator.of(context)
                                .pushNamed(MasukanDataAdmin.nameRoute);
                          }
                        },
                        icon: Image.asset("images/btnlistrik.png")),
                  ),
                  Text(
                    'PENGINFORMASIAN PEMADAMAN ',
                    style: TextStyle(
                        fontFamily: "poppins-regular",
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 97,
                    height: 75,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(PelaporanAdmin.nameRoute);
                        },
                        icon: Image.asset("images/btnlistrik.png")),
                  ),
                  Text(
                    'PELAPORAN AMPEREMETER ',
                    style: TextStyle(
                        fontFamily: "poppins-regular",
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
