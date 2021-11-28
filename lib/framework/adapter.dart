import 'package:conta_da_epata_online/framework/businessModel.dart';
import 'package:conta_da_epata_online/framework/dataModel.dart';

abstract class Adapter<BM extends BusinessModel, DM extends DataModel> {
  BM createBusinessModel(DM? dataModel);

  DM createDataModel(BM businessModel);
}
