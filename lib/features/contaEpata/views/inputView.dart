import 'dart:html';

import 'package:conta_da_epata_online/features/contaEpata/viewActionsContaEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/viewModelContaEpata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  final ViewModelContaEpata viewModel;
  final ViewActionsContaEpata viewActions;

  InputView(
    BuildContext context, {
    Key? key,
    required this.viewModel,
    required this.viewActions,
  });
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1000),
      lastDate: DateTime(3000),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.input,
      helpText: "mês/dia/ano",
    );
    if (picked != null && picked != selectedDate) {
      viewActions.AtualizaNumeroEpataAtual(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 50.0),
          child: CupertinoButton(
            child: Text(
              "Selecione uma data",
            ),
            onPressed: () {
              _selectDate(context);
            },
            borderRadius: BorderRadius.circular(20),
            color: ThemeData().primaryColor,
          ),
        ),
      ],
    );
  }
}
