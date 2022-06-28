import 'package:flutter/material.dart';
import 'package:transporter_portail/pages/clients/clients.dart';
import 'package:transporter_portail/pages/demandes/demandes.dart';
import 'package:transporter_portail/pages/demandes/demandesRembPackup.dart';
import 'package:transporter_portail/pages/demandes/demandestat.dart';

import 'package:transporter_portail/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case demandesPageRoute:
      //TODO:modifyyyyyy LES ROUTES HNA
      return _getPageRoute(MyWidget());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    default:
      return _getPageRoute(ClientsPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
