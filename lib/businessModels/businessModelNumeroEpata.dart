import 'package:conta_da_epata_online/framework/businessModel.dart';

class BusinessModelNumeroEpata extends BusinessModel {
  int numeroEpataAtual;
  final DateTime dataDaLua;

  BusinessModelNumeroEpata({
    required this.numeroEpataAtual,
    required this.dataDaLua,
  }) : super(id: dataDaLua.toString());

  factory BusinessModelNumeroEpata.vazio() => BusinessModelNumeroEpata(numeroEpataAtual: 15, dataDaLua: DateTime.now());
}
