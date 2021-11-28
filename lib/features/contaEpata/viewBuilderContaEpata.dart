import 'package:conta_da_epata_online/framework/viewBuilder.dart';
import 'viewActionsContaEpata.dart';
import 'viewContaEpata.dart';
import 'viewModelContaEpata.dart';

class ViewBuilderContaEpata extends ViewBuilder<ViewContaEpata, ViewModelContaEpata, ViewActionsContaEpata> {
  @override
  ViewContaEpata createView(ViewModelContaEpata? viewModel, ViewActionsContaEpata viewActions) {
    return ViewContaEpata(
      viewModel: viewModel,
      viewActions: viewActions,
    );
  }
}
