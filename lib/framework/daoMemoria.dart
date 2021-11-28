import 'dao.dart';
import 'dataModel.dart';

abstract class DaoMemoria<DM extends DataModel> extends Dao<DM> {

  final List<DM> dados;

  DaoMemoria({required this.dados});

  int getPosById(String id) {
    for (int i = 0; i < dados.length; i++) {
      DM dataModel = dados[i];
      if (dataModel.id == id) return i;
    }
    return -1;
  }

  DM? getDataModel(String id) {
    int pos = getPosById(id);
    if (pos >= 0)
      return dados[pos];
    else
      return null;
  }

  List<DM> getDataModels() {
    List<DM> lista = List.empty(growable: true);
    for (int i = 0; i < dados.length; i++) {
      DM dataModel = dados[i];
      lista.add(dataModel);
    }
    return lista;
  }

  saveDataModel(DM dataModel) {
    int pos = getPosById(dataModel.id);
    if (pos < 0) {
      dados.add(dataModel);
    } else {
      dados[pos] = dataModel;
    }
  }

  removeDataModel(DM dataModel) {
    int pos = getPosById(dataModel.id);
    if (pos >= 0) dados.removeAt(pos);
  }
}
