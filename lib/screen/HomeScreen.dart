import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan5/widgets/PendidikanTerakhir.dart';

import '../widgets/Agama.dart';
import '../widgets/Bahasa.dart';
import '../widgets/jenisKelamin.dart';
import '../widgets/PendidikanTerakhir.dart';
import '../widgets/StatusPernikahan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllernama = TextEditingController();
  TextEditingController controlleralamat = TextEditingController();
  TextEditingController controllertempatlahir = TextEditingController();
  TextEditingController controllertanggallahir = TextEditingController();

  void _kosongkan() {
    setState(() {
      controllernama.text = "";
      controllertempatlahir.text = "";
      controlleralamat.text = "";
      controllertanggallahir.text = "";
      jenisKelaminDipilih = "";
      agamaDipilih = "Silakan Pilih Agama Anda";
      pendidikanDipilih = "Pendidikan Terakhir Anda";
      statusPernikahanDipilih = "";
      chKIndonesia = false;
      chKInggris = false;
      chKArab = false;
      chKSunda = false;
      chKJawa = false;
      chKMadura = false;
      chKMandarin = false;
      chKJepang = false;
      chKKorea = false;
    });
  }

  void _kirimData() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        width: 100.0,
        height: 200.0,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK")),
                ),
                Text("Nama Lengkap : " + controllernama.text),
                Text("Alamat : " + controlleralamat.text),
                Text("Tempat Lahir : " + controllertempatlahir.text),
                Text("Tanggal Lahir : " + controllertanggallahir.text),
                Text("Jenis Kelamin : " + jenisKelaminDipilih),
                Text("Status : " + statusPernikahanDipilih),
                Text("Agama : " + agamaDipilih),
                Text("Pendidikan : " + pendidikanDipilih),
                Text("Kemampuan Berbahasa : " + cariBahasa()),
              ],
            )
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.camera),
          title: const Text("Latihan Flutter"),
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.list),
                        hintText: "Nama Lengkap",
                        labelText: "Nama Lengkap"),
                    controller: controllernama,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        hintText: "Alamat",
                        labelText: "Alamat"),
                    controller: controlleralamat,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.location_on),
                        hintText: "Tempat Lahir",
                        labelText: "Tempat Lahir"),
                    controller: controllertempatlahir,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: "Tanggal Lahir",
                        labelText: "Tanggal Lahir"),
                    controller: controllertanggallahir,
                  ),
                  const Divider(
                    height: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  JenisKelamin(),
                  const Divider(
                    height: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  StatusPernikahan(),
                  const Divider(
                    height: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  Bahasa(),
                  const Divider(
                    height: 0,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  Agama(),
                  Pendidikan(),
                  ElevatedButton(
                      onPressed: () {
                        _kirimData();
                      },
                      child: const Text("Proses")),
                  ElevatedButton(
                      onPressed: () {
                        _kosongkan();
                      },
                      child: const Text("Kosongkan")),
                ],
              ),
            ),
          ],
        ));
  }
}
