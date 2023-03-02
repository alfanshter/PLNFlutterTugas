import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/app/controllers/pelaporan_controller.dart';
import 'package:plnfix/user/notify_sukses.dart';

void main() async {
  runApp(PelaporanAdmin());
}

class PelaporanAdmin extends StatelessWidget {
  final edtalamat = TextEditingController();
  final edtdetail = TextEditingController();
  final edtlainnya = TextEditingController();
  static const nameRoute = '/pelaporanadmin';
  final pelaporanC = Get.put(PelaporanController());

  @override
  Widget build(BuildContext context) {
    DatabaseReference _dbref =
        FirebaseDatabase.instance.reference().child("laporan");

    return Scaffold(
        appBar: AppBar(
          title: Text('Tampilan Penerimaan Pelaporan '),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
          stream: _dbref.onValue,
          builder: (context, snapshot) {
            var alamat = snapshot.data?.snapshot.child('alamat').value.toString();
            var detail = snapshot.data?.snapshot.child('detail').value.toString();
            var lainnya = snapshot.data?.snapshot.child('lainnya').value.toString();
            return Container(
              width: double.infinity,
              color: Color(0x9943AA6C),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'ALAMAT PELAPOR',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          maxLines: 3,
                          alamat.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              backgroundColor: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'DETAIL KERUSAKAN  ',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          maxLines: 3,
                          detail.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              backgroundColor: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'LAINNYA',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'poppins-regular'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          maxLines: 3,
                          lainnya.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              backgroundColor: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 123,
                    height: 48,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff0099F6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(MenuAdmin.nameRoute, (route) => false);
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
