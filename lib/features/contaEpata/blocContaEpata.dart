import 'package:conta_da_epata_online/framework/bloc.dart';
import 'package:conta_da_epata_online/framework/viewModel.dart';
import 'package:conta_da_epata_online/providers/numeroEpataAtual/providerNumeroEpataAtual.dart';
import 'viewModelContaEpata.dart';
import 'blocEventContaEpata.dart';

class BlocContaEpata extends Bloc<ViewModelContaEpata, BlocEventContaEpata> {
  @override
  void onReceiveBlocEvent(BlocEventContaEpata blocEvent) {
    if (blocEvent is BlocEventContaEpataInicializaViewModel) _inicializaViewModel(blocEvent);
    if (blocEvent is BlocEventGetNumeroEpataAtual) getNumeroEpataAtual(blocEvent);
  }

  var dataAtual = DateTime.now();
  void _inicializaViewModel(BlocEventContaEpataInicializaViewModel blocEvent) {
    BlocEventGetNumeroEpataAtual blocEventGetNumeroEpata = BlocEventGetNumeroEpataAtual(dataDaLua: blocEvent.dataDaLua);

    getNumeroEpataAtual(blocEventGetNumeroEpata);
  }

  void getNumeroEpataAtual(BlocEventGetNumeroEpataAtual blocEvent) {
    int numeroEpataAtual = ProviderNumeroEpata().getNumeroEpataAtual(blocEvent.dataDaLua);

    int diaDoMes = blocEvent.dataDaLua.month - 2;
    if (diaDoMes <= 0) {
      diaDoMes = diaDoMes + 12;
    }

    int ResultadoContaEpata = numeroEpataAtual + blocEvent.dataDaLua.day + diaDoMes;

    while (true) {
      if (ResultadoContaEpata <= 28) {
        break;
      }
      if (ResultadoContaEpata > 40) {
        ResultadoContaEpata -= 40;
      } else {
        if (ResultadoContaEpata > 30) {
          ResultadoContaEpata -= 30;
        } else {
          ResultadoContaEpata -= 7;
        }
      }
    }

    if (ResultadoContaEpata <= 7) {
      ViewModelContaEpata viewModel = ViewModelContaEpata(
          dataAtual: DateTime.now(),
          descricao: "Pela conta da epata, teremos Lua Crescente no dia " +
              blocEvent.dataDaLua.day.toString() +
              "/" +
              blocEvent.dataDaLua.month.toString() +
              "/" +
              blocEvent.dataDaLua.year.toString(),
          urlDaLua: "../../assets/iconesLua/lua_crescente.png",
          numeroEpata: numeroEpataAtual);

      this.sendViewModelOut(viewModel);
    } else if (ResultadoContaEpata <= 14) {
      ViewModelContaEpata viewModel = ViewModelContaEpata(
          dataAtual: DateTime.now(),
          descricao: "Pela conta da epata, teremos Lua Cheia no dia " +
              blocEvent.dataDaLua.day.toString() +
              "/" +
              blocEvent.dataDaLua.month.toString() +
              "/" +
              blocEvent.dataDaLua.year.toString(),
          urlDaLua: "../../assets/iconesLua/lua_cheia.png",
          numeroEpata: numeroEpataAtual);

      this.sendViewModelOut(viewModel);
    } else if (ResultadoContaEpata <= 21) {
      ViewModelContaEpata viewModel = ViewModelContaEpata(
          dataAtual: DateTime.now(),
          descricao: "Pela conta da epata, teremos Lua Minguante no dia " +
              blocEvent.dataDaLua.day.toString() +
              "/" +
              blocEvent.dataDaLua.month.toString() +
              "/" +
              blocEvent.dataDaLua.year.toString(),
          urlDaLua: "../../assets/iconesLua/lua_minguante.png",
          numeroEpata: numeroEpataAtual);

      this.sendViewModelOut(viewModel);
    } else if (ResultadoContaEpata <= 28) {
      ViewModelContaEpata viewModel = ViewModelContaEpata(
          dataAtual: DateTime.now(),
          descricao: "Pela conta da epata, teremos Lua Nova no dia " +
              blocEvent.dataDaLua.day.toString() +
              "/" +
              blocEvent.dataDaLua.month.toString() +
              "/" +
              blocEvent.dataDaLua.year.toString(),
          urlDaLua: "../../assets/iconesLua/lua_nova.png",
          numeroEpata: numeroEpataAtual);

      this.sendViewModelOut(viewModel);
    }
  }
}
