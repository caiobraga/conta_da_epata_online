import 'package:conta_da_epata_online/framework/businessModel.dart';
import 'package:conta_da_epata_online/framework/provider.dart';

import 'adapter.dart';
import 'dao.dart';
import 'dataModel.dart';

abstract class ProviderDireto<DM extends DataModel, BM extends BusinessModel, DAO extends Dao<DM>, AD extends Adapter<BM, DM>> extends Provider<BM> {
  final DAO dao;
  final AD adapter;

  ProviderDireto({required this.dao, required this.adapter});

  BM getBusinessModel(String id) {
    DM? dataModel = dao.getDataModel(id);
    BM businessModel = adapter.createBusinessModel(dataModel);
    return businessModel;
  }

  List<BM> getBusinessModels() {
    List<BM> lista = List.empty(growable: true);
    dao.getDataModels().forEach((dataModel) {
      BM businessModel = adapter.createBusinessModel(dataModel);
      lista.add(businessModel);
    });
    return lista;
  }

  saveBusinessModel(BM businessModel) {
    DM dataModel = adapter.createDataModel(businessModel);
    dao.saveDataModel(dataModel);
  }

  removeBusinessModel(BM businessModel) {
    DM dataModel = adapter.createDataModel(businessModel);
    dao.removeDataModel(dataModel);
  }
}
