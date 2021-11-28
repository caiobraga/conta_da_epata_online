import 'package:conta_da_epata_online/framework/businessModel.dart';

abstract class Provider<BM extends BusinessModel> {
  BM getBusinessModel(String id);

  List<BM> getBusinessModels();

  saveBusinessModel(BM businessModel);

  removeBusinessModel(BM businessModel);
}
