import 'dart:html';
import 'dart:ui';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_launcher/url_launcher.dart';

class ComoCalcularEpataView extends StatelessWidget {
  ComoCalcularEpataView(
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
                "Como funciona o cálculo da Epata",
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
                    "A conta da epata é calculada pela soma do número da epata + o dia da data em questão + o número do mês. Tendo em conta que os meses para a conta da Epata começam em março, portanto março seria iguai a um, abril igual a dois e assim por diante.",
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
                LinkRenderer(
                  anchorText: 'Link para doação',
                  link: 'https://www.buymeacoffee.com/contaepata',
                  child: CupertinoButton(
                    child: TextRenderer(
                      element: ParagraphElement(),
                      text: Text(
                        "Sua doação ajuda a manter o site vivo, se puder clique aqui",
                      ),
                    ),
                    onPressed: () {
                      launch("https://www.buymeacoffee.com/contaepata");
                    },
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeData().primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
