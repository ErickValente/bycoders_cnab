import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portal_cnab/src/screens/register/stores/register_store.dart';
import 'package:portal_cnab/src/widgets/custom_button.dart';
import 'package:portal_cnab/src/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterStore registerStore = RegisterStore();

  @override
  void initState() {
    super.initState();
    registerStore.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de usuário'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (context) {
            return SizedBox(
                width: width,
                height: height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                          width: width,
                          title: 'Nome',
                          controller: registerStore.nameController),
                      const SizedBox(height: 20),
                      CustomTextField(
                          width: width,
                          title: 'Login',
                          controller: registerStore.loginController),
                      const SizedBox(height: 20),
                      CustomTextField(
                          width: width,
                          title: 'Senha',
                          controller: registerStore.passwordController),
                      const SizedBox(height: 30),
                      registerStore.loading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                CustomButton(
                                    width: width,
                                    title: 'Cadastrar',
                                    onPressed: registerStore.register),
                              ],
                            )
                    ]));
          },
        ));
  }
}
