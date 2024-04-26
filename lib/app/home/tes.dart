import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JadwalPage extends StatefulWidget {
  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  List<Map<String, dynamic>> _jadwal = [];
  List<int> _jadwalPesanan = [];

  @override
  void initState() {
    super.initState();
    _fetchJadwal();
    _fetchJadwalPesanan();
  }

  cekData(String id, String waktu) async {
    var url = Uri.parse("http://192.168.190.48/api_sipfut/cekjadwal.php");

    var response = await http.post(url, body: {
      "cari": id,
      "waktu": waktu,
    });
    // var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      String message = jsonResponse['message'];
      if (message == 'Sukses') {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> _fetchJadwal() async {
    final response = await http.get(Uri.parse('http://192.168.190.48/api_sipfut/tampil.php'));
    if (response.statusCode == 200) {
      setState(() {
        _jadwal = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load jadwal');
    }
  }

  Future<void> _fetchJadwalPesanan() async {
    final response = await http
        .get(Uri.parse('http://192.168.190.48/api_sipfut/cekjadwal.php?cari=1&waktu=2024-04-26'));
    if (response.statusCode == 200) {
      setState(() {
        _jadwalPesanan = List<int>.from(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load jadwal pesanan');
    }
  }

  bool isJadwalPesanan(String id) {
    return _jadwalPesanan.contains(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Jadwal'),
      ),
      body: ListView.builder(
        itemCount: _jadwal.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              _jadwal[index]['waktu'] + '/' + _jadwal[index]['idjadwal'],
              style: TextStyle(
                color: cekData("${_jadwal[index]['idjadwal']}", '2024-04-26')
                    ? Colors.red
                    : Colors.blue,
                // decoration: isJadwalPesanan() ? TextDecoration.lineThrough : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
