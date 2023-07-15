import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/atualizacao/atualizacao_objetos_page.dart';
import 'package:get_state_manager/basico/reatividade_page.dart';
import 'package:get_state_manager/controllers/controllers_home_page.dart';
import 'package:get_state_manager/controllers/getxcontroller/controller_getx.dart';
import 'package:get_state_manager/controllers/getxcontroller/getx_controller_example_page.dart';
import 'package:get_state_manager/home_page.dart';
import 'package:get_state_manager/tipos/tipos_obs_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_nulos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_page.dart';

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
              binding: BindingsBuilder.put(() => ControllerGetx()),
              page: () => const GetxControllerExamplePage(),
            ),
          ],
        ),
      ],
    );
  }
}
