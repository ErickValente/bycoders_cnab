import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portal_cnab/src/screens/main/pages/transaction/stores/transaction_store.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TransactionStore transactionStore = TransactionStore();

  @override
  void initState() {
    super.initState();
    transactionStore.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      return SizedBox(
          width: width,
          height: height,
          child: transactionStore.loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const SizedBox(height: 25),
                    const Text('Valor total já importado:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    Text('R\$ ${transactionStore.total}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.red)),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: transactionStore.readTxt,
                        child: const Text('Importar novo Cnab'),
                      ),
                    ),
                  ],
                ));
    });
  }
}
