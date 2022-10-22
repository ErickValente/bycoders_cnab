// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_LoginStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loginControllerAtom =
      Atom(name: '_LoginStoreBase.loginController', context: context);

  @override
  TextEditingController get loginController {
    _$loginControllerAtom.reportRead();
    return super.loginController;
  }

  @override
  set loginController(TextEditingController value) {
    _$loginControllerAtom.reportWrite(value, super.loginController, () {
      super.loginController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_LoginStoreBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$authAsyncAction =
      AsyncAction('_LoginStoreBase.auth', context: context);

  @override
  Future<void> auth() {
    return _$authAsyncAction.run(() => super.auth());
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic setContext(dynamic value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setContext');
    try {
      return super.setContext(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loginController: ${loginController},
passwordController: ${passwordController}
    ''';
  }
}
