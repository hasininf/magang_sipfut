import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sipfut_app/app/home/apiservice.dart';
import 'package:sipfut_app/app/login/loginpage.dart';

part 'controller.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  late final LoginController c;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _penggunaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    getData('');
    super.initState();
    c = LoginController();
  }

  Future getData(String search) async {
    var uri = Uri.parse('http://192.168.56.227/API_Belajarflutter/search.php');
    var response = await http.get(uri);

    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        // data = json.decode(response.body);
      });
    } else {}
  }

  // Future addData(String hp, String nama, String pass) async {
  //   var response;
  //   // var uri = Uri.parse('https://dasar().nexteam.id/insert.php');
  //   var uri = Uri.parse('http://192.168.190.48/api_sipfut/insert.php');
  //   response = await http.post(uri, body: {
  //     "nama": nama,
  //     "hp": hp,
  //     "pass": pass,
  //   });
  // }

  void Registrasi() async {
    var url = Uri.parse(ServiceApi().baseurl + "register");

    var response = await http.post(url, body: {
      "email": _penggunaController.text,
      "nama": _namaController.text,
      "password": _passwordController.text,
    });
    // var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      // Dapatkan nilai 'message' dari objek JSON

      int message = jsonResponse['status'];
      if (message == 1) {
        // _penggunaController.clear();
        // _namaController.clear();
        // _passwordController.clear();
        Fluttertoast.showToast(
          msg: jsonResponse['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLogin()));
      } else {
        print('duplikat');
        _showErrorDialog();
      }
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
                  Text(
                    'Silahkan daftar disini',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    child: TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        // icon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        hintText: 'Masukkan Nama Lengkap',
                        labelText: 'Nama Lengkap',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Lengkap tidak boleh kosong';
                        }
                        return null;
                      },
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
                          text: 'Sudah punya akun ',

                          // style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'klik disini',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                            // TextSpan(text: ' world!'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        // onPressed: () => c.login(context),
                        onPressed: () {
                          // Navigator.of(context).pop();
                          Registrasi();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff03B1FB)), // Ganti warna dengan warna yang Anda inginkan
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyLogin(),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffE76A6A)), // Ganti warna dengan warna yang Anda inginkan
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.0), // Ubah radius sesuai keinginan Anda
                            ),
                          ),
                        ),
                        child: const Text('Login',
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

// void submit(BuildContext context, String nama, String pengguna, String password) {
//   if (nama.isEmpty || pengguna.isEmpty || password.isEmpty) {
//     final snackBar = SnackBar(
//       duration: const Duration(seconds: 5),
//       content: Text("data  harus diisi"),
//       backgroundColor: Colors.red,
//     );

//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     return;
//   }

//   AlertDialog alert = AlertDialog(
//     title: Text("Login Berhasil"),
//     content: Container(
//       child: Text("Selamat Anda Berhasil login"),
//     ),
//     actions: [
//       TextButton(
//         child: Text('Ok'),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//     ],
//   );

//   showDialog(context: context, builder: (context) => alert);
//   return;
// }

// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
// }
