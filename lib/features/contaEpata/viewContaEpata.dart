import 'dart:async';

import 'package:conta_da_epata_online/config.dart';
import 'package:conta_da_epata_online/features/contaEpata/views/comoCalcularEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/views/comoCalcularNumeroEpata.dart';
import 'package:conta_da_epata_online/features/contaEpata/views/historia.dart';
import 'package:conta_da_epata_online/features/contaEpata/views/outputView.dart';
import 'package:conta_da_epata_online/features/contaEpata/views/sobre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conta_da_epata_online/framework/view.dart';
import 'viewActionsContaEpata.dart';
import 'viewModelContaEpata.dart';
import './views/inputView.dart';
import 'package:conta_da_epata_online/config.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewContaEpata extends View<ViewModelContaEpata, ViewActionsContaEpata> {
  ViewContaEpata({
    Key? key,
    ViewModelContaEpata? viewModel,
    required ViewActionsContaEpata viewActions,
  }) : super(key: key, viewModel: viewModel, viewActions: viewActions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Image.asset(
                "../../assets/iconesLua/lua_cheia.png",
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Conta da Epata online",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Roboto",
              ),
            ),
          ],
        ),
        actions: [
          Switch(
            value: currentTheme.getStateTheme(),
            onChanged: (bool value) {
              currentTheme.switchTheme();
            },
          ),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    if (viewModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                OutputView(context, viewModel: viewModel!, viewActions: viewActions),
                InputView(
                  context,
                  viewActions: viewActions,
                  viewModel: viewModel!,
                ),
                ComoCalcularNumeroEpataView(context),
                ComoCalcularEpataView(context),
                SobreView(context),
                HistoriaView(context),
              ],
            ),
          )
        ],
      );
    }
  }
}
