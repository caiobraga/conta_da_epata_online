import 'package:conta_da_epata_online/framework/daoPadrao.dart';
import 'package:conta_da_epata_online/framework/dataModel.dart';

import 'dataModelNumeroEpata.dart';

class DaoNumeroEpata {
  final DateTime dataDaLua;

  DaoNumeroEpata({required this.dataDaLua});

  DataModelNumeroEpata getDataModel() {
    return DataModelNumeroEpata(dataDaLua: dataDaLua, numeroEpataAtual: _getNumeroEpataAtual(dataDaLua));
  }

  int _getNumeroEpataAtual(DateTime dataDaLua) {
    int diferencaAno = dataDaLua.year - 2021;
    if (diferencaAno > 0 && dataDaLua.month >= 3) {
      int epataAtual = 15 + (diferencaAno * 11);
      while (true) {
        if (epataAtual < 30) {
          return epataAtual;
        } else {
          epataAtual = epataAtual - 30;
        }
      }
    } else {
      return 15;
    }
  }
}
