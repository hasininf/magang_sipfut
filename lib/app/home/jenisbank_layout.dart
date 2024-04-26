import 'package:flutter/material.dart';

class MyBank extends StatefulWidget {
  const MyBank({super.key});

  @override
  State<MyBank> createState() => _MyBankState();
}

class _MyBankState extends State<MyBank> {
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Pilih Bank',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Image.asset('assets/bca.png'),
                                ),
                                Text(
                                  'BANK BCA',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('Ubah'),
                          ],
                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Image.asset('assets/bca.png'),
                                ),
                                Text(
                                  'BANK BCA',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('Ubah'),
                          ],
                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Image.asset('assets/bca.png'),
                                ),
                                Text(
                                  'BANK BCA',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('Ubah'),
                          ],
                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Image.asset('assets/bri.png'),
                                ),
                                Text(
                                  'BANK BRI',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('Ubah'),
                          ],
                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Image.asset('assets/mandiri.png'),
                                ),
                                Text(
                                  'BANK MANDIRI',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text('Ubah'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => {},
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
