import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portal_cnab/src/screens/login/stores/login_store.dart';
import 'package:portal_cnab/src/screens/register/register_screen.dart';
import 'package:portal_cnab/src/widgets/custom_button.dart';
import 'package:portal_cnab/src/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  void initState() {
    super.initState();
    loginStore.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(body: Observer(
      builder: (context) {
        return Container(
          color: Colors.blueGrey,
          child: Center(
            child: Container(
              width: width / 3,
              height: height / 2,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('Bem vindo ao sistema CNAB!',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 55),
                  CustomTextField(
                      width: width,
                      title: 'Login',
                      controller: loginStore.loginController),
                  const SizedBox(height: 15),
                  CustomTextField(
                      width: width,
                      title: 'Senha',
                      controller: loginStore.passwordController,
                      obscure: true),
                  const SizedBox(height: 30),
                  loginStore.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            CustomButton(
                                width: width,
                                title: 'Acessar',
                                onPressed: loginStore.auth),
                            const SizedBox(height: 15),
                            InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen())),
                                child: const Text(
                                    'Não possui um acesso? clique aqui e crie sua conta'))
                          ],
                        )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
