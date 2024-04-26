part of 'loginpage.dart';

class LoginController2 {
  final formKey = GlobalKey<FormState>();
  // final _namaController = TextEditingController();
  // final _penggunaController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final passwordController = TextEditingController();
  // final _

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Error'),
          content: Text("Email or Password salah!"),
        ),
      );
    }
  }
}
