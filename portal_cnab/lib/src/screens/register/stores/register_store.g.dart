// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_RegisterStoreBase.loading', context: context);

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

  late final _$nameControllerAtom =
      Atom(name: '_RegisterStoreBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$loginControllerAtom =
      Atom(name: '_RegisterStoreBase.loginController', context: context);

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
      Atom(name: '_RegisterStoreBase.passwordController', context: context);

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

  late final _$registerAsyncAction =
      AsyncAction('_RegisterStoreBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase', context: context);

  @override
  dynamic setContext(dynamic value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setContext');
    try {
      return super.setContext(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
nameController: ${nameController},
loginController: ${loginController},
passwordController: ${passwordController}
    ''';
  }
}
