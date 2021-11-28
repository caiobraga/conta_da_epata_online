import 'package:conta_da_epata_online/framework/presenter.dart';
import 'blocEventContaEpata.dart';
import 'blocContaEpata.dart';
import 'viewActionsContaEpata.dart';
import 'viewBuilderContaEpata.dart';
import 'viewContaEpata.dart';
import 'viewModelContaEpata.dart';

class PresenterContaEpata
    extends Presenter<ViewContaEpata, ViewModelContaEpata, ViewActionsContaEpata, BlocEventContaEpata, BlocContaEpata, ViewBuilderContaEpata> {
  PresenterContaEpata({
    required BlocContaEpata bloc,
    required ViewBuilderContaEpata viewBuilder,
    required ViewActionsContaEpata viewActions,
  }) : super(
          bloc: bloc,
          viewBuilder: viewBuilder,
          viewActions: viewActions,
        ) {
    _enviaEventoInicializacaoViewModel();
  }

  factory PresenterContaEpata.presenter() {
    BlocContaEpata bloc = BlocContaEpata();
    ViewBuilderContaEpata viewBuilder = ViewBuilderContaEpata();
    ViewActionsContaEpata viewActions = ViewActionsContaEpata(bloc.pipeIn);
    return PresenterContaEpata(bloc: bloc, viewBuilder: viewBuilder, viewActions: viewActions);
  }

  void _enviaEventoInicializacaoViewModel() {
    BlocEventContaEpataInicializaViewModel blocEvent = BlocEventContaEpataInicializaViewModel(dataDaLua: DateTime.now());
    this.bloc.pipeIn.send(blocEvent);
  }
}
