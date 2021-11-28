import 'dataModel.dart';

abstract class Dao<DM extends DataModel> {
  DM? getDataModel(String id);

  List<DM> getDataModels();

  saveDataModel(DM dataModel);

  removeDataModel(DM dataModel);
}
