import 'package:conta_da_epata_online/framework/bloc.dart';
import 'package:conta_da_epata_online/framework/viewModel.dart';
import 'package:conta_da_epata_online/providers/numeroEpataAtual/providerNumeroEpataAtual.dart';
import 'package:conta_da_epata_online/util/dateTimeUtils.dart';
import 'package:intl/intl.dart';
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
    _atualizaViewModel(ProviderNumeroEpata().getNumeroEpataAtual(blocEvent.dataDaLua), blocEvent.dataDaLua);
  }

  void getNumeroEpataAtual(BlocEventGetNumeroEpataAtual blocEvent) {
    _atualizaViewModel(ProviderNumeroEpata().getNumeroEpataAtual(blocEvent.dataDaLua), blocEvent.dataDaLua);
  }

  void _atualizaViewModel(int numeroEpataAtual, DateTime dataInformada) {
    List<String> memoriaDeCalculo = List.empty(growable: true);
    int resultadoContaEpata = _calculaContaEpata(dataInformada, numeroEpataAtual, memoriaDeCalculo);
    ViewModelContaEpata viewModel = _getViewModel(resultadoContaEpata, dataInformada, numeroEpataAtual, memoriaDeCalculo);
    sendViewModelOut(viewModel);
  }

  int _calculaMesEpata(DateTime dataInformada, List<String> memoriaDeCalculo) {
    memoriaDeCalculo.add("Cálculo do mês Epata:");
    memoriaDeCalculo.add("Mês atual menos dois");
    int mesEpata = dataInformada.month - 2;
    memoriaDeCalculo.add(dataInformada.month.toString() + "-2= " + mesEpata.toString());
    if (mesEpata <= 0) {
      memoriaDeCalculo.add("Como o resultado foi <= 0 devemos adicionar mais doze");
      mesEpata += 12;
    }

    return mesEpata;
  }

  int _calculaContaEpata(DateTime dataInformada, int numeroEpataAtual, List<String> memoriaDeCalculo) {
    int mesEpata = _calculaMesEpata(dataInformada, memoriaDeCalculo);
    int resultado = numeroEpataAtual + dataInformada.day + mesEpata;

    memoriaDeCalculo.add(
        "Com o cálculo do mês epata concluido, agora poderemos fazer a conta, para isso somamos o mês da epata com numero atual da epata e o dia da data informada = " +
            numeroEpataAtual.toString() +
            "+" +
            dataInformada.day.toString() +
            "+" +
            mesEpata.toString() +
            "=" +
            resultado.toString());

    while (true) {
      if (resultado <= 28) {
        memoriaDeCalculo.add("Como o resultado atual é menor do que 28, retornamos o resultado = " + resultado.toString());
        break;
      }
      if (resultado > 40) {
        memoriaDeCalculo.add("Como o resultado atual é maior do que 40, subtraimos 40 doresultado.");
        resultado -= 40;
      } else {
        if (resultado > 30) {
          memoriaDeCalculo.add("Como o resultado atual é maior do que 30, subtraimos 30 do resultado resultado.");
          resultado -= 30;
        } else {
          resultado -= 7;
          memoriaDeCalculo.add("Como o resultado atual é maior do que 28, subtraimos 7 do resultado.");
        }
      }
    }
    return resultado;
  }

  ViewModelContaEpata _getViewModel(int resultadoContaEpata, DateTime dataInformada, int numeroEpataAtual, List<String> memoriaDeCalculo) {
    String tipoDeLua = "";
    String urlDaLua = "";
    if (resultadoContaEpata <= 7) {
      tipoDeLua = "Crescente";
      urlDaLua = "../../assets/iconesLua/lua_crescente.png";
      memoriaDeCalculo.add("Como o resultado do cáclulo é menor ou igual a 7, teremos lua crescente no dia " + formataDataDDMMYYYY(dataInformada));
    }
    if (resultadoContaEpata <= 14) {
      tipoDeLua = "Cheia";
      urlDaLua = "../../assets/iconesLua/lua_cheia.png";
      memoriaDeCalculo.add("Como o resultado do cáclulo é entre 8 e 14, teremos lua Cheia no dia " + formataDataDDMMYYYY(dataInformada));
    }
    if (resultadoContaEpata <= 21) {
      tipoDeLua = "Minguante";
      urlDaLua = "../../assets/iconesLua/lua_minguante.png";
      memoriaDeCalculo.add("Como o resultado do cáclulo é entre 15 e 21, teremos lua minguante no dia " + formataDataDDMMYYYY(dataInformada));
    }
    if (resultadoContaEpata <= 28) {
      tipoDeLua = "Nova";
      urlDaLua = "../../assets/iconesLua/lua_nova.png";
      memoriaDeCalculo.add("Como o resultado do cáclulo é entre 22 e 28, teremos lua nova no dia " + formataDataDDMMYYYY(dataInformada));
    }

    return ViewModelContaEpata(
      dataAtual: DateTime.now(),
      descricao: "Pela conta da epata, teremos Lua $tipoDeLua no dia " + formataDataDDMMYYYY(dataInformada),
      urlDaLua: urlDaLua,
      numeroEpata: numeroEpataAtual,
      memoriaDeCalculo: memoriaDeCalculo,
    );
  }
}
