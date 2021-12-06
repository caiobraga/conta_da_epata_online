import 'dart:html';
import 'dart:ui';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class HistoriaView extends StatelessWidget {
  HistoriaView(
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
            TextRenderer(
              element: ParagraphElement(),
              text: Text(
                "Um pouco da história do site",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20),
          child: Align(
              child: Column(
            children: [
              TextRenderer(
                element: ParagraphElement(),
                text: Text(
                  "O site foi idealizado por duas pessoas durante uma peregrinação da igreja católica. Um evento que conteve bastante espiritualidade, fortes emoções e muitas amizades, além de um encontro mais próximo de Deus de da comunidade.",
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
              TextRenderer(
                element: ParagraphElement(),
                text: Text(
                  "Nesse contexto duas pessoas de contextos diferentes se conheceram, o Caio Braga e o Uderley Coslob. O Uderly é proprietário de terra, de origem italiana e além de usar o método da conta Epata no dia-a-dia, manteve a tradição ensinando a mesma conta mostrada aqui para seus filhos e um dia para Caio em uma peregrinação e como programador se viu no dever de criar um site para tentar preservar essa tradição tão linda que os dois sentem dó de perder. E para que isso não aconteça, sonharam desde o início com esse projeto.",
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
            ],
          )),
        ),
      ],
    );
  }
}
