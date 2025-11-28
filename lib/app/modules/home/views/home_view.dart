import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';
// import '../../../core/values/app_styles.dart';
import '../controllers/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Inicio'),
        // centerTitle: true,
        leading: IconButton(icon: Icon(Icons.sort), onPressed: () {}),
        actions: [
          SearchAnchor(
            builder: (context, controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView();
                },
              );
            },
            suggestionsBuilder: (context, controller) {
              return [
                ListTile(title: Text('Sugerencia 1'), onTap: () {}),
                ListTile(title: Text('Sugerencia 2'), onTap: () {}),
              ];
            },
          ),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          // Simular cerrar sesión y volver al login
          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () {
          //     // Simular cerrar sesión y volver al login
          //     Get.offAllNamed(Routes.LOGIN);
          //   },
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Banner de escuchados recientemente
            MusicBanner(),
            //* Sección de Favoritos (slider horizontal)
            FavoriteSlider(),
            //* Sección de Albums
            AlbumListView(),
          ],
        ),
      ),
    );
  }
}

