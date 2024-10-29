import 'package:get/get.dart';

import '../../presentation/getx/binding_barrel.dart';
import '../../presentation/pages/page_barrel.dart';
import '../constants/route_constants.dart';

class AppRoutes {

  final _pages = <GetPage>[

    GetPage(
      name: routeInitial,
      page: () => Todos(),
      binding: TodosBinding(),
    ),
  ];

  get pages => _pages;
}