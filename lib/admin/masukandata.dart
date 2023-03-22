import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/informasiadmin.dart';
import 'package:plnfix/app/controllers/pelaporan_controller.dart';
import 'package:plnfix/user/notify_sukses.dart';

void main() {
  runApp(MasukanDataAdmin());
}

class MasukanDataAdmin extends StatelessWidget {
  final edtpenyebab = TextEditingController();
  final edtalamat = TextEditingController();
  final edtjangkawaktu = TextEditingController();
  static const nameRoute = '/masukandataadmin';
  final pelaporanC = Get.put(PelaporanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Memasukkan Data'),
        backgroundColor: Colors.black,
      ),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bglamput.png"), fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 100,
              height: 100,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(InformasiAdmin.nameRoute);
                  },
                  icon: Image.asset("images/btnadd.png")),
            ),
          )),
    );
  }
}
