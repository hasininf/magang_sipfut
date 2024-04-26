import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sipfut_app/app/home/apiservice.dart';
import 'package:sipfut_app/app/home/jenisbank_layout.dart';

class PemesananDetail extends StatefulWidget {
  const PemesananDetail({super.key});

  @override
  State<PemesananDetail> createState() => _PemesananDetailState();
}

class _PemesananDetailState extends State<PemesananDetail> {
  DateTime pilihTanggal = DateTime.now();

  TextEditingController id = new TextEditingController();
  TextEditingController tanggal = new TextEditingController();
  TextEditingController nominal = new TextEditingController();

  Future<List> senddata() async {
    var url = Uri.parse(ServiceApi().baseurl + "order.php");

    final response = await http.post(url, body: {
      "idjadwal": '2',
      "tanggal": '2024-04-08',
      "nominal": '2023',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse == 'Sukses') {
        Fluttertoast.showToast(
          msg: "Registrasi Sukses!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Registrasi Errro!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      return [];
    } else {
      Fluttertoast.showToast(
        msg: "Registrasi gagal!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return [];
    }
  }

  void tambahOrder() async {
    var url = Uri.parse(ServiceApi().baseurl + "order.php");

    var response = await http.post(url, body: {
      "idjadwal": '2',
      "tanggal": '2024-04-08',
      "nominal": '2023',
    });
    // var response = await http.get(uri);

    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // Dapatkan nilai 'message' dari objek JSON
      String message = jsonResponse['message'];
      if (message == 'Sukses') {
        _showSuccessDialog(jsonResponse['message']);
      } else {
        _showSuccessDialog(jsonResponse['message']);
      }
    } else {
      _showSuccessDialog(jsonResponse['message']);
    }
  }

  void _showSuccessDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sukses"),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        _dateController.text =
            picked.toString().substring(0, 10); // Mengubah nilai inputan setelah dipilih
      }
    }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          'Detail Pesanan Anda',
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
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Pesanan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Ringkasan pesanan lapangan anda'),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(width: 1.0, color: Colors.grey),
                            bottom: BorderSide(width: 1.0, color: Colors.grey), // Atur border atas
                          ),
                          // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Minggu, 31 Desember 2024',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Lapangan 1'),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Ubah',
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('klik');
                                    // Navigator.push(
                                    //     context, MaterialPageRoute(builder: (context) => MyBank()));
                                    // navigate to desired screen
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Pemesan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Nina'),
                      Text('087774664442'),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(width: 1.0, color: Colors.grey),
                            bottom: BorderSide(width: 1.0, color: Colors.grey), // Atur border atas
                          ),
                          // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pembayaran',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Pilih Metode Pembayaran'),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Ubah',
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => MyBank()));
                                    // navigate to desired screen
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transfer Bank'),
                          Text('BANK MANDIRI'),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Pembayaran'),
                          Text(
                            'Rp. 50.000',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => {print('object'), senddata()},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff33A616)), // Ganti warna dengan warna yang Anda inginkan
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Ubah radius sesuai keinginan Anda
                                ),
                              ),
                            ),
                            child: const Text('Pesan Sekarang',
                                style: TextStyle(
                                    color: Colors.white)), // Ubah warna teks jika diperlukan
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class CardJadwal extends StatelessWidget {
  const CardJadwal({
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
            Text(
              '10:00 s/d 11:00',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              'Sudah dipesan',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
