import 'package:flutter/material.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  DateTime pilihTanggal = DateTime.now();
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
        title: Text(
          'Profil',
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
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    CardJadwal(),
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              // controller: _namaController,
              decoration: InputDecoration(
                // // icon: Icon(Icons.people),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(15)),
                // ),
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
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => {},
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
                child: const Text('Simpan Perubahan',
                    style: TextStyle(color: Colors.white)), // Ubah warna teks jika diperlukan
              ),
            ),
          ),
        ],
      ),
    );
  }
}
