import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/app/controllers/pelaporan_controller.dart';
import 'package:plnfix/user/notify_sukses.dart';
void main() async {
  runApp(Pelaporan());
}

class Pelaporan extends StatelessWidget {
  final edtalamat = TextEditingController();
  final edtdetail = TextEditingController();
  final edtlainnya = TextEditingController();

  final pelaporanC = Get.put(PelaporanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pelaporan'),
        backgroundColor: Colors.black,
      ),
      body: Container(
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
                'ALAMAT PELAPOR',
                style: TextStyle(fontSize: 20, fontFamily: 'poppins-regular'),
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
                'DETAIL KERUSAKAN  ',
                style: TextStyle(fontSize: 20, fontFamily: 'poppins-regular'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
              child: TextField(
                controller: edtdetail,
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
                'LAINNYA',
                style: TextStyle(fontSize: 20, fontFamily: 'poppins-regular'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35, 17, 35, 0),
              child: TextField(
                controller: edtlainnya,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
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
                    if (edtalamat.text.isNotEmpty &&
                        edtdetail.text.isNotEmpty &&
                        edtlainnya.text.isNotEmpty) {
                      pelaporanC
                          .send_laporan(
                              alamat: edtalamat.text,
                              detail: edtdetail.text,
                              lainnya: edtlainnya.text)
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
      ),
    );
  }
}
