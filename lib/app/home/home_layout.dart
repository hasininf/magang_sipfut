import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sipfut_app/app/home/apiservice.dart';
import 'package:sipfut_app/app/home/jadwal_layout.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return Scaffold(
      // extendBodyBehindAppBar: true, // Memperluas body di belakang AppBar
      backgroundColor: Color(0xffD0F8DB),
      // backgroundColor: Colors.red,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 50),
                        width: MediaQuery.of(context).size.width / 2,
                        // color: Colors.amber,
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hai, ' + box.read('account_name').toString().toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 22, top: 50),
                        width: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.topRight,
                        child: Text(
                          'Masuk',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Container(
                      margin: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), // Warna bayangan
                            spreadRadius: 2, // Meratakan radius
                            blurRadius: 5, // Radius blur
                            offset: Offset(0, 3), // Offset dari bayangan (x, y)
                          ),
                        ],
                      ),
                      // transform: Matrix4.translationValues(0.0, -100.0, 0.0),
                      height: 170.0,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(DateTime.now().toString().substring(0, 10)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              PemesanContainer(),
                              // SizedBox(width: 20), // Spacer antara kedua container
                              SisaKursiContainer(),
                            ],
                          ),
                        ],
                      )
                      // color: Colors.red,
                      ),
                ),
              ],
            ),
            Lapangan(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Fasilitas Kami',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Carousel(),
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        // List widget yang ingin ditampilkan dalam carousel
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage('https://minan.sch.id/wp-content/uploads/2017/07/musholla.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  'https://asset.kompas.com/crops/rVtaB7aZx5JS-2okOApYR6PFOz0=/0x0:2100x1400/750x500/data/photo/2022/04/08/625015d5e723b.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  'https://asset.kompas.com/crops/rVtaB7aZx5JS-2okOApYR6PFOz0=/0x0:2100x1400/750x500/data/photo/2022/04/08/625015d5e723b.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class Lapangan extends StatelessWidget {
  const Lapangan({
    super.key,
  });

  Future<List<dynamic>> fetchApiData() async {
    final response = await http.get(Uri.parse(ServiceApi().baseurl + "lapangan"));

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      // Jika response sukses (status code 200), maka kita akan mengembalikan data yang telah di-decode dari JSON
      return json.decode(response.body)['data'];
    } else {
      // Jika response gagal, kita akan melemparkan sebuah exception
      print('gagal');
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    return FutureBuilder(
        future: fetchApiData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else {
            List<dynamic> items = snapshot.data;

            items.forEach((e) {
              list.add(InkWell(
                onTap: () {
                  print('Di Klik');
                  print(e["id"]);
                  Navigator.pushNamed(context, MyJadwal.routeName, arguments: e["id"]);

                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MyJadwal()));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("http://192.168.48.48:8000/storage/" + e['gambar']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ));
            });
            log(list.length.toString());
            return CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: list,
            );
            // return ListView.builder(
            //     itemCount: items.length,
            //     shrinkWrap: true,
            //     itemBuilder: (BuildContext context, int index) {
            //       // return ListTile(
            //       //   title: Text(items[index]['nama']),
            //       // );
            //       return CarouselSlider(
            //         options: CarouselOptions(
            //           aspectRatio: 16 / 9,
            //           autoPlay: true,
            //           enlargeCenterPage: true,
            //         ),
            //         items: [
            //           // List widget yang ingin ditampilkan dalam carousel
            //           snapshot.data.map(
            //             (e) => Container(
            //               margin: EdgeInsets.all(5.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(8.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(e['gambar']),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       );
            //     });
          }
        });
  }
}

class IncomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Income',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$1000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OutcomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Outcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$500',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PemesanContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        // color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_circle_down,
              color: Colors.green,
              size: 30,
            ),
            Text(
              'Jadwal Terisi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '100',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SisaKursiContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_circle_up,
              color: Colors.red,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              'Jadwal Kosong',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '50',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
