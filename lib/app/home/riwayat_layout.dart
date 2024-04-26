import 'package:flutter/material.dart';

class MyRiwayat extends StatelessWidget {
  const MyRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(
          'Riwayat Pesanan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffD0F8DB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xffD0F8DB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                    CardRiwayat(),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class CardRiwayat extends StatelessWidget {
  const CardRiwayat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffD0F8DB),
      elevation: 1, // Tingkat elevasi kartu (bayangan)
      margin: EdgeInsets.only(top: 5), // Jarak antara kartu dengan widget di sekitarnya
      child: ListTile(
        // isThreeLine: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('23 Desember 2024'),
            Text(
              'Sudah dibayar',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ), // Judul kartu
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              // color: Colors.red,
              child: Text('Waktu : 19:00 s/d 20:00 WIB'),
            ),
            Container(
              width: double.infinity,
              // color: Colors.red,
              child: Text('Lapangan Kertajaya'),
            ),
          ],
        ), // Lapangan Kertajaya
        // leading: Icon(Icons.account_circle), // Ikon di sebelah kiri kartu
        // trailing: Icon(Icons.arrow_forward), // Ikon di sebelah kanan kartu
        onTap: () {
          // Aksi ketika kartu diklik
        },
      ),
    );
  }
}
