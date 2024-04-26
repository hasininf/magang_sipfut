import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sipfut_app/app/home/apiservice.dart';

class MyJadwal extends StatefulWidget {
  static const String routeName = '/jadwal';
  @override
  _MyJadwalState createState() => _MyJadwalState();
}

class _MyJadwalState extends State<MyJadwal> {
  List<dynamic> _data = [];
  List<dynamic> _cek = [];

  TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day, // Hanya menampilkan tanggal
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text =
            picked.toString().substring(0, 10); // Mengubah nilai inputan setelah dipilih
      });
      dataJadwal(); // Panggil dataJadwal setelah tanggal dipilih
    }
  }

  @override
  void initState() {
    super.initState();
    dataJadwal();
  }

  Future<void> dataJadwal() async {
    final response = await http.get(Uri.parse(ServiceApi().baseurl + 'jadwal/'));
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void jadwalOrder(String cari, String waktu) async {
    print('Adalah $cari $waktu');
    final response = await http
        .get(Uri.parse('http://192.168.190.48/api_sipfut/cekjadwal.php?cari=$cari&&waktu=$waktu'));
    if (response.statusCode == 200) {
      setState(() {
        _cek = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final int data = ModalRoute.of(context)!.settings.arguments as int;
    // log(data.toString());
    print(data.toString());
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Ubah warna sesuai keinginan Anda
        ),
        title: Text(
          'Info Jadwal',
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
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    _selectDate(context); // Memanggil fungsi _selectDate ketika inputan diklik
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _dateController,
                      textAlign: TextAlign.center,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        // labelText: 'Pilih Tanggal',
                        hintText: DateTime.now().toString().substring(0, 10),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(15)),
                        // ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  // jadwalOrder(_data[index]['idjadwal'], _dateController.text);
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      color: Color(0xffD0F8DB),
                      elevation: 1, // Tingkat elevasi kartu (bayangan)
                      margin: EdgeInsets.only(top: 5),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_data[index]['waktu']),
                            Text(
                              'Tersedia',
                              style: TextStyle(
                                color: _cek.length == 0 ? Colors.green : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
