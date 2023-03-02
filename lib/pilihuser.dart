import 'package:flutter/material.dart';
import 'package:plnfix/admin/loginadmin.dart';
import 'package:plnfix/user/loginuser.dart';

void main() {
  runApp(PilihUser());
}

class PilihUser extends StatelessWidget {
  static const nameRoute = '/pilihuser';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman Pengguna"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bgpilihuser.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 244,
                height: 65,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginUser.nameRoute);
                    },
                    child: Text(
                      "Pengguna",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "poppins-regular",
                          color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 49,
              ),
              Container(
                width: 244,
                height: 65,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginAdmin.nameRoute);
                    },
                    child: Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "poppins-regular",
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}
