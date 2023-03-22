import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/app/controllers/pelaporan_controller.dart';
import 'package:plnfix/user/notify_sukses.dart';

void main() {
  runApp(InformasiAdmin());
}

class InformasiAdmin extends StatelessWidget {
  final edtpenyebab = TextEditingController();
  final edtalamat = TextEditingController();
  final edtjangkawaktu = TextEditingController();
  static const nameRoute = '/informasiadmin';
  final pelaporanC = Get.put(PelaporanController());
  @override
  Widget build(BuildContext context) {
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("informasi");

    return Scaffold(
        appBar: AppBar(
          title: Text('Halaman Mengisi Data'),
          backgroundColor: Colors.black,
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

            edtpenyebab.text = penyebab.toString();
            edtjangkawaktu.text = jangkawaktu.toString();
            edtalamat.text = alamat.toString();
            return Container(
              width: double.infinity,
              color: Color(0x9943AA6C),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'PENYEBAB PEMADAMAN ',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
                    child: TextField(
                      controller: edtpenyebab,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'ALAMAT PEMADAMAN ',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
                    child: TextField(
                      controller: edtalamat,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'JANGKA WAKTU PEMADAMAN ',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
                    child: TextField(
                      controller: edtjangkawaktu,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
                    width: 123,
                    height: 48,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff0099F6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          if (edtalamat.text.isNotEmpty &&
                              edtpenyebab.text.isNotEmpty &&
                              edtjangkawaktu.text.isNotEmpty) {
                            pelaporanC
                                .send_informasi(
                                    penyebab: edtpenyebab.text,
                                    alamat: edtalamat.text,
                                    jangkawaktu: edtjangkawaktu.text)
                                .then((value) {
                              if (value == 1) {
                                Navigator.of(context)
                                    .pushNamed(NotifySukses.nameRoute);
                              } else {
                                Get.snackbar('Lapor', 'Silahkan coba lagi');
                              }
                            });
                          } else {
                            Get.snackbar('Lapor', 'Jangan kosongi kolom',
                                colorText: Colors.white);
                          }
                        },
                        child: Text(
                          "Selesai",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "poppins-regular",
                              color: Colors.white),
                        )),
                  )
                ],
              ),
            );
          },
        ));
  }
}
