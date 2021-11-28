import 'package:conta_da_epata_online/framework/viewModel.dart';
import 'package:flutter/cupertino.dart';

class ViewModelContaEpata extends ViewModel {
  final DateTime dataAtual;
  final String urlDaLua;
  final String descricao;
  final TextEditingController controlerFieldData = TextEditingController();
  final int numeroEpata;

  ViewModelContaEpata({
    required this.dataAtual,
    required this.urlDaLua,
    required this.descricao,
    required this.numeroEpata,
  }) : super();
}
