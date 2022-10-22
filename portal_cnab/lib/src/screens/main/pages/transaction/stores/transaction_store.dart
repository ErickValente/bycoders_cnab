import 'dart:convert';
import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:portal_cnab/src/configuration/constants.dart';
part 'transaction_store.g.dart';

class TransactionStore = _TransactionStoreBase with _$TransactionStore;

abstract class _TransactionStoreBase with Store {
  // ignore: prefer_typing_uninitialized_variables
  var screenContext;

  @action
  setContext(value) => screenContext = value;

  @observable
  bool loading = false;

  @observable
  List bodyJson = [];

  @observable
  double total = 0;

  @action
  Future<void> readTxt() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      String text = utf8.decode(file.bytes!);
      List lines = text.split('\n');

      lines.forEach((element) {
        String data = element.toString();
        if (data.length > 1) {
          int transactionType = int.parse(data.substring(0, 1));
          double amount = int.parse(data.substring(9, 19)) / 100;
          String time =
              '${data.substring(42, 44)}:${data.substring(44, 46)}:${data.substring(46, 48)}';
          bool subtract = false;
          switch (transactionType) {
            case 2:
              subtract = true;
              break;
            case 3:
              subtract = true;
              break;
            case 9:
              subtract = true;
          }
          bodyJson.add({
            'transactionType': data.substring(0, 1),
            'date': data.substring(1, 9),
            'amount': subtract ? amount * -1 : amount,
            'cpf': data.substring(19, 30),
            'card': data.substring(30, 42),
            'time': time,
            'storeOwner': data.substring(48, 62),
            'storeName': data.substring(62, 80)
          });
        }
      });
      registerCnab();
    } else {
      // User canceled the picker
    }
  }

  @action
  Future<void> registerCnab() async {
    loading = true;
    Uri url = Uri.parse('$baseUrl/transactions/register');
    try {
      var response = await http
          .post(url, headers: header, body: jsonEncode(bodyJson))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success']) {
          loading = false;
          AwesomeDialog(
                  context: screenContext,
                  autoHide: const Duration(seconds: 3),
                  dialogType: DialogType.success,
                  title: 'Sucesso',
                  desc: 'Cnab Importado com sucesso')
              .show();
          getTotal();
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

  @action
  Future<void> getTotal() async {
    loading = true;
    Uri url = Uri.parse('$baseUrl/transactions/getSum');
    try {
      var response = await http
          .get(url, headers: header)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success']) {
          data = data['data'];
          loading = false;
          if (data.length > 0) {
            total = double.parse(data[0]['total'] ?? 0);
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


  _TransactionStoreBase() {
    getTotal();
  }
}
