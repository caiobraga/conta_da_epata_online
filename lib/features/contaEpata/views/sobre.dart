import 'dart:html';
import 'dart:ui';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  SobreView(
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
              "Sobre",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20),
          child: Flexible(
            child: Align(
              child: Text(
                "A conta da epata é uma técnica de cálculo das fases da lua baseada nas fases da lua. Atualmente faltam estudos para comprovar sua origem, mas o fato é que essa forma de calcular as fases e ciclos da lua é muito popular na zona rural de diversas regiões do Brasil, em particular, aquelas com origem italiana. Esse cálculo é bastante usado, pois diversas atividades no ambiente rural se baseiam nas fases da lua para indicarem os melhores momentos de execução de diversos afazeres",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Roboto",
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 20,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
