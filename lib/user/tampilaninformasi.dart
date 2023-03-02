import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TampilanInformasi());
}

class TampilanInformasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseReference _dbref =
    FirebaseDatabase.instance.reference().child("informasi");

    return Scaffold(
      appBar: AppBar(
        title: Text('Tampilan Informasi'),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: _dbref.onValue,
        builder: (context, snapshot) {
          var alamat = snapshot.data?.snapshot.child('alamat').value.toString();
          var jangkawaktu = snapshot.data?.snapshot.child('jangkawaktu').value.toString();
          var penyebab = snapshot.data?.snapshot.child('penyebab').value.toString();
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
                    style: TextStyle(fontSize: 20, fontFamily: 'poppins-regular'),
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
                        penyebab.toString(),
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
                    'ALAMAT PEMADAMAN ',
                    style: TextStyle(fontSize: 20, fontFamily: 'poppins-regular'),
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
                    'JANGKA WAKTU PEMADAMAN ',
                    style: TextStyle(fontSize: 20, fontFamily: 'poppins-regular'),
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
                        jangkawaktu.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
          );

        },
      )

    );
  }
}
