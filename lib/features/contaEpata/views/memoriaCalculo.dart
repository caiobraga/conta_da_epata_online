import 'dart:html';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class MemoriaCalculoView extends StatelessWidget {
  final ViewModelContaEpata viewModel;
  final ViewActionsContaEpata viewActions;

  MemoriaCalculoView(
    BuildContext context, {
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });

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
                "Como chegamos a esse resultado",
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
                    viewModel.memoriaDeCalculo.join("\n"),
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
            ),
          ),
        ),
      ],
    );
  }
}
