import 'package:conta_da_epata_online/framework/blocEvent.dart';

abstract class BlocEventContaEpata extends BlocEvent {}

class BlocEventContaEpataInicializaViewModel extends BlocEventContaEpata {
  final DateTime dataDaLua;

  BlocEventContaEpataInicializaViewModel({required this.dataDaLua});
}

class BlocEventGetNumeroEpataAtual extends BlocEventContaEpata {
  final DateTime dataDaLua;

  BlocEventGetNumeroEpataAtual({required this.dataDaLua});
}
