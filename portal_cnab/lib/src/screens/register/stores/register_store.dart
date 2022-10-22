import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portal_cnab/src/configuration/constants.dart';
import 'package:portal_cnab/src/screens/login/login_screen.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  // ignore: prefer_typing_uninitialized_variables
  var screenContext;

  @action
  setContext(value) => screenContext = value;

  @observable
  bool loading = false;

  @observable
  var nameController = TextEditingController();

  @observable
  var loginController = TextEditingController();

  @observable
  var passwordController = TextEditingController();

  @action
  Future<void> register() async {
    loading = true;
    Uri url = Uri.parse('$baseUrl/access/new');
    var body = jsonEncode({
      'name': nameController.text.toString(),
      'login': loginController.text.toString(),
      'password': passwordController.text.toString()
    });
    try {
      var response = await http
          .post(url, headers: header, body: body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success']) {
          loading = false;
          AwesomeDialog(
                  context: screenContext,
                  showCloseIcon: true,
                  dialogType: DialogType.success,
                  title: 'Ops, Tivemos um problema...',
                  desc: 'Erro de servidor.')
              .show();
          Navigator.of(screenContext).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        } else {
          loading = false;
          AwesomeDialog(
                  context: screenContext,
                  showCloseIcon: true,
                  dialogType: DialogType.error,
                  title: 'Ops, Tivemos um problema...',
                  desc: 'Erro de servidor.')
              .show();
        }
      } else {
        loading = false;
        AwesomeDialog(
                context: screenContext,
                showCloseIcon: true,
                dialogType: DialogType.error,
                title: 'Ops, Tivemos um problema...',
                desc: 'Erro de servidor.')
            .show();
      }
    } catch (error) {
      loading = false;
      AwesomeDialog(
              context: screenContext,
              showCloseIcon: true,
              dialogType: DialogType.error,
              title: 'Ops, Tivemos um problema...',
              desc: error.toString())
          .show();
    }
  }
}
