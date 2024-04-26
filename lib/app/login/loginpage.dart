import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sipfut_app/app/home/apiservice.dart';
import 'package:sipfut_app/app/home/beranda.dart';
import 'package:sipfut_app/app/login/registerpage.dart';

part 'controller_login.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  late final LoginController2 c;
  TextEditingController _penggunaController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    c = LoginController2();
  }

  // void CekLogin() async {
  //   print('tes');
  //   var url = Uri.parse(ServiceApi().baseurl + "login");

  //   var response = await http.post(url, body: {
  //     "email": _penggunaController.text,
  //     "password": _passwordController.text,
  //   });
  //   // var response = await http.get(uri);

  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);

  //     // Dapatkan nilai 'message' dari objek JSON

  //     int message = jsonResponse['status'];
  //     if (message == 1) {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Beranda()));
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "Email atau password salah.!",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //     }
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: "Registrasi gagal!",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   }
  // }

  void CekLogin() async {
    // var url = 'https://example.com/api/endpoint';
    var url = Uri.parse(ServiceApi().baseurl + "login");
    final box = GetStorage();
    // Datos que deseas enviar en el cuerpo de la solicitud POST
    var data = {
      'email': 'cc@gmail.com',
      'password': '123',
    };

    // Codifica los datos a JSON
    var body = json.encode(data);

    try {
      // Realiza la solicitud POST
      var response = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Indica al servidor que esperas JSON en el cuerpo de la solicitud
        },
        body: body,
      );

      // Verifica el código de estado de la respuesta
      if (response.statusCode == 200) {
        // Si la solicitud fue exitosa, imprime la respuesta
        print('Respuesta: ${response.body}');
        var jsonResponse = jsonDecode(response.body);

        // Dapatkan nilai 'message' dari objek JSON
        String message = jsonResponse['status'];
        if (message == '1') {
          _penggunaController.clear();
          _passwordController.clear();
          box.write('account_id', jsonResponse['user']['id']);
          box.write('account_name', jsonResponse['user']['name']);
          print(box.read('account_id'));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Beranda()));
        }
      } else {
        // Si la solicitud falló, imprime el código de estado
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Captura cualquier error que ocurra durante la solicitud
      print('Error: $e');
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

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Gagal"),
          content: Text("Gagal menambahkan user. Silakan coba lagi."),
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
    return Scaffold(
        backgroundColor: Color(0xffD0F8DB),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: c.formKey,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    // color: Colors.amber,
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    child: Text(
                      'Silahkan daftar disini',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: TextFormField(
                      controller: _penggunaController,
                      decoration: InputDecoration(
                        // icon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        hintText: 'Masukkan Nama Pengguna',
                        labelText: 'Nama Pengguna',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Pengguna tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.vpn_key_sharp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          hintText: 'masukkan Kata Sandi',
                          labelText: 'Kata Sandi'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata Sandi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      child: Container(
                        // color: Colors.amber,
                        alignment: Alignment.topRight,
                        child: RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            text: 'Lupa kata sandi ',
                            // style: DefaultTextStyle.of(context).style,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'klik disini',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Color(0xff3CB38F))),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          CekLogin();
                        },
                        // onPressed: () => Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BerandaWrapper(),
                        //   ),
                        // ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff3CB38F)), // Ganti warna dengan warna yang Anda inginkan
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.0), // Ubah radius sesuai keinginan Anda
                            ),
                          ),
                        ),
                        child: const Text('Masuk',
                            style:
                                TextStyle(color: Colors.white)), // Ubah warna teks jika diperlukan
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyRegister(),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff54DBB3)), // Ganti warna dengan warna yang Anda inginkan
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.0), // Ubah radius sesuai keinginan Anda
                            ),
                          ),
                        ),
                        child: const Text('Daftar',
                            style:
                                TextStyle(color: Colors.white)), // Ubah warna teks jika diperlukan
                      ),
                    ),
                  ),

                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Username',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(hintText: 'Username'),
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(hintText: 'Username'),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
