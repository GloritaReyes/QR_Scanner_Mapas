
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        final uiProvider = Provider.of<UiProvider>(context);

    final currenIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      //seleccionar en el menu
      onTap: (int i )  => uiProvider.selectedMenuOpt = i,
      currentIndex: currenIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          
          icon: Icon(Icons.map, ),
          label: 'Mapa'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration, ),
          label: 'Direcciones'
        ),
      ],
    );
  }
}