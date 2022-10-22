import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portal_cnab/src/configuration/constants.dart';
import 'package:portal_cnab/src/screens/main/main_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  // ignore: prefer_typing_uninitialized_variables
  var screenContext;

  @action
  setContext(value) => screenContext = value;

  @observable
  bool loading = false;

  @observable
  var loginController = TextEditingController();

  @observable
  var passwordController = TextEditingController();

  @action
  Future<void> auth() async {
    loading = true;
    Uri url = Uri.parse('$baseUrl/access/auth');
    var body = 
        jsonEncode({'login': loginController.text.toString(), 'password': passwordController.text.toString()});
    try {
      var response = await http
          .post(url, headers: header, body: body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success']) {
          data = data['data'];
          if (data.length > 0) {
            loading = false;
            storage.write('token', data[0]['token'].toString());
            Navigator.of(screenContext).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (route) => false);
          } else {
            loading = false;
            AwesomeDialog(
                    context: screenContext,
                    showCloseIcon: true,
                    dialogType: DialogType.error,
                    title: 'Ops, Tivemos um problema...',
                    desc: 'Login ou senha inválido.')
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
