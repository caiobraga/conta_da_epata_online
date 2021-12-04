import 'dart:html';
import 'dart:ui';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComoCalcularNumeroEpataView extends StatelessWidget {
  ComoCalcularNumeroEpataView(
    BuildContext context,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Origem do cálculo",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20),
          child: Align(
            child: Column(
              children: [
                Text(
                  "Não se sabe ao certo como o número da epata surgiu, porém, ele vem sido passado de geração em geração através da tradição oral. A teoria suposta por nós diz que possivelmente o número tenha surgido da observação dos ciclos da lua de forma empírica e tenha sido preservado pela tradição oral. O que se sabe ao certo é que para que o cálculo da epata funcione deve o todo dia 1 de março seja acrescentado 11 ao número da epata anterior, e caso o mesmo passe de 30, esse valor deve ser subtraído do número  formando assim o novo número que será usado até o dia 1 de março do próximo ano",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Roboto",
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 20,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
