import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:conta_da_epata_online/framework/pipe.dart';
import 'package:conta_da_epata_online/framework/viewActions.dart';
import 'blocEventContaEpata.dart';

class ViewActionsContaEpata extends ViewActions<BlocEventContaEpata> {
  ViewActionsContaEpata(Pipe<BlocEventContaEpata> blocPipeIn) : super(blocPipeIn);

  void AtualizaNumeroEpataAtual(DateTime dataDaLua) {
    BlocEventGetNumeroEpataAtual blocEvent = BlocEventGetNumeroEpataAtual(dataDaLua: dataDaLua);
    blocPipeIn.send(blocEvent);
  }
}
