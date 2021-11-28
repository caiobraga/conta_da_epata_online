import 'dart:html';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutputView extends StatelessWidget {
  final ViewModelContaEpata viewModel;
  final ViewActionsContaEpata viewActions;

  OutputView(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Image.asset(
                  viewModel.urlDaLua,
                  width: 400,
                  height: 400,
                  fit: BoxFit.fill,
                ),
              ),
              Text(viewModel.descricao),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 15.0,
                ),
                child: Text(
                  "O numero da Epata nesse ano: " + viewModel.numeroEpata.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
