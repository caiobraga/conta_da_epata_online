import 'package:conta_da_epata_online/daos/numeroEpata/daoNumeroEpata.dart';
import 'package:conta_da_epata_online/daos/numeroEpata/dataModelNumeroEpata.dart';
import 'package:conta_da_epata_online/framework/providerDireto.dart';
import '../../businessModels/businessModelNumeroEpata.dart';
import 'adapterNumeroEpata.dart';

class ProviderNumeroEpata {
  int getNumeroEpataAtual(DateTime dataDaLua) {
    return DaoNumeroEpata(dataDaLua: dataDaLua).getDataModel().numeroEpataAtual;
  }
}
