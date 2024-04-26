import 'package:flutter/material.dart';
import 'package:sipfut_app/app/home/home_layout.dart';
import 'package:sipfut_app/app/home/pemesanan_layout.dart';
import 'package:sipfut_app/app/home/profil_layout.dart';
import 'package:sipfut_app/app/home/riwayat_layout.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _index = 0;
  final layouts = [
    MyHome(),
    MyRiwayat(),
    // MyJadwal(),
    Pemesanan(),
    MyProfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: SizedBox(),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Colors.transparent,
      body: layouts[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        currentIndex: _index,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        // selectedFontSize: 14, // Ukuran font untuk item yang dipilih
        // unselectedFontSize: 14, // Ukuran font untuk item yang tidak dipilih
        type: BottomNavigationBarType.fixed, // Membuat ukuran teks tetap

        fixedColor: Colors.green,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
          // BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Jadwal"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Pemesanan"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_sharp), label: "Profil"),
        ],
      ),
    );
  }
}
