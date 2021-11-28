import 'package:conta_da_epata_online/framework/viewActions.dart';

import 'view.dart';
import 'viewModel.dart';

abstract class ViewBuilder<V extends View, VM extends ViewModel, VA extends ViewActions> {
  V createView(VM? viewModel, VA viewActions);
}
