import 'package:conta_da_epata_online/businessModels/businessModelNumeroEpata.dart';
import 'package:conta_da_epata_online/daos/numeroEpata/dataModelNumeroEpata.dart';
import 'package:conta_da_epata_online/framework/adapter.dart';

class AdapterNumeroEpata {
  BusinessModelNumeroEpata createBusinessModel(DataModelNumeroEpata? dataModel) {
    if (dataModel == null)
      return BusinessModelNumeroEpata.vazio();
    else
      return BusinessModelNumeroEpata(
        numeroEpataAtual: dataModel.numeroEpataAtual,
        dataDaLua: dataModel.dataDaLua,
      );
  }

  DataModelNumeroEpata createDataModel(BusinessModelNumeroEpata businessModel) {
    return DataModelNumeroEpata(
      dataDaLua: businessModel.dataDaLua,
      numeroEpataAtual: businessModel.numeroEpataAtual,
    );
  }
}
