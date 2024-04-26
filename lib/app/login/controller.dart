part of 'registerpage.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  // final _namaController = TextEditingController();
  // final _penggunaController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final passwordController = TextEditingController();
  // final _

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print(' => $context');
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
