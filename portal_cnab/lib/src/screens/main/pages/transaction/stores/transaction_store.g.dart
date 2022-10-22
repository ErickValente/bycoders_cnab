// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on _TransactionStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_TransactionStoreBase.loading', context: context);

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

  late final _$readTxtAsyncAction =
      AsyncAction('_TransactionStoreBase.readTxt', context: context);

  @override
  Future<void> readTxt() {
    return _$readTxtAsyncAction.run(() => super.readTxt());
  }

  late final _$_TransactionStoreBaseActionController =
      ActionController(name: '_TransactionStoreBase', context: context);

  @override
  dynamic setContext(dynamic value) {
    final _$actionInfo = _$_TransactionStoreBaseActionController.startAction(
        name: '_TransactionStoreBase.setContext');
    try {
      return super.setContext(value);
    } finally {
      _$_TransactionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
