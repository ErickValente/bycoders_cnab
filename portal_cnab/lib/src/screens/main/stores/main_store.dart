import 'package:mobx/mobx.dart';
import 'package:portal_cnab/src/screens/main/pages/settings/settings_page.dart';
import 'package:portal_cnab/src/screens/main/pages/transaction/transaction_page.dart';
part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  // ignore: prefer_typing_uninitialized_variables
  var screenContext;

  @action
  setContext(value) => screenContext = value;

  @observable
  bool loading = false;

  @observable
  int index = 0;

  @action
  setIndex(value) => index = value;

  @observable
  List pages = [
    const TransactionPage(),
    const SettingsPage(),
  ];
}