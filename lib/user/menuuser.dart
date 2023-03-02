import 'package:flutter/material.dart';

void main() {
  runApp(MenuUser());
}

class MenuUser extends StatelessWidget {
  static const nameRoute = '/menuuser';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Menu'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0x9943AA6C),
        child: Column(
          children: [
            SizedBox(height: 12),
            Text(
              'Selamat Datang',
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
                    Navigator.of(context).pushNamed('/tampilaninformasi');
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
                    Navigator.of(context).pushNamed('/pelaporan');
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
      ),
    );
  }
}
