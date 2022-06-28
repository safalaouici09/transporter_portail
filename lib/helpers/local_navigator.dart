import 'package:flutter/cupertino.dart';
import 'package:transporter_portail/constants/controllers.dart';
import 'package:transporter_portail/routing/router.dart';
import 'package:transporter_portail/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: demandesPageRoute,
    );
