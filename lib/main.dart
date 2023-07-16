import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/atualizacao/atualizacao_objetos_page.dart';
import 'package:get_state_manager/basico/reatividade_page.dart';
import 'package:get_state_manager/controllers/controllers_home_page.dart';
import 'package:get_state_manager/controllers/getxcontroller/controller_getx.dart';
import 'package:get_state_manager/controllers/getxcontroller/getx_controller_example_page.dart';
import 'package:get_state_manager/first_rebuild/first_rebuild_page.dart';
import 'package:get_state_manager/getx_widget/getx_widget_page.dart';
import 'package:get_state_manager/home_page.dart';
import 'package:get_state_manager/local_state_widget/local_state_widget_page.dart';
import 'package:get_state_manager/tipos/tipos_obs_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_nulos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_page.dart';
import 'package:get_state_manager/workers/workers_page.dart';
import 'package:get_state_manager/workers/workerscontroller/workers_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/basico',
          page: () => ReatividadePage(),
        ),
        GetPage(
          name: '/tiposReativos',
          page: () => TiposReativosPage(),
        ),
        GetPage(
          name: '/tiposReativosGenericos',
          page: () => TiposReativosGenericosPage(),
        ),
        GetPage(
          name: '/tiposReativosGenericosNulos',
          page: () => TiposReativosGenericosNulosPage(),
        ),
        GetPage(
          name: '/tiposObs',
          page: () => TiposObsPage(),
        ),
        GetPage(
          name: '/atualizacaoObjetos',
          page: () => AtualizacaoObjetosPage(),
        ),
        GetPage(
          name: '/controllers',
          page: () => const ControllersHomePage(),
          children: [
            GetPage(
              name: '/getxControllers',
              //binding: BindingsBuilder.put(() => ControllerGetx()),
              // Para exemplo de usar Get.reload() não pode usar o .put, nesse caso
              // deverá usar o Get.lazyPut para fazer reload do controller. Pois o
              // reload só funciona para fábricas e put já instancia o controller
              // nesse exemplo, diferente do lazyPut.
              binding: BindingsBuilder(() {
                Get.lazyPut(() => ControllerGetx());
              }),
              page: () => const GetxControllerExamplePage(),
            ),
          ],
        ),
        GetPage(
          name: '/getxWidget',
          page: () => const GetxWidgetPage(),
        ),
        GetPage(
          name: '/localStateWidget',
          page: () => const LocalStateWidgetPage(),
        ),
        GetPage(
          name: '/workers',
          binding: BindingsBuilder.put(() => WorkersController()),
          page: () => const WorkersPage(),
        ),
        GetPage(
          name: '/firstRebuild',
          page: () => const FirstRebuildPage(),
        ),
      ],
    );
  }
}
