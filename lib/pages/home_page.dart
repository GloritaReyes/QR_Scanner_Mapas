import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_pages.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorBar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
             icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context,listen: false)
              .borrarTodos();
            },
           
          )
        ],
      ),

      body:  _HomePageBody(),

      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    //pata cambiar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    
    //scanprovider
    final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);
    switch (currentIndex){
      
      case 0:
         scanListProvider.cargarScanPorTipo('geo');
         return MapasPage();

      case 1:
         scanListProvider.cargarScanPorTipo('http');
         return DireccionesPage();

      default:
      return MapasPage();
    }

  }
}