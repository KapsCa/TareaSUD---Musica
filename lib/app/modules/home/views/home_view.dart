import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../core/values/values.dart';
import '../controllers/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.deepPurple),
              padding: EdgeInsets.only(left: 15, top: 30),
              margin: EdgeInsets.zero,
              child: Text(AppStrings.menuTitle, style: AppStyles.menuTitle),
            ),
            ListTile(
              title: const Text(
                AppStrings.logOut,
                style: AppStyles.menuOptions,
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
                Get.offNamed(AppPages.LOGIN);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Banner de escuchados recientemente
            MusicBanner(),
            //* Sección de Favoritos (ListView horizontal)
            FavoriteSlider(),
            const SizedBox(height: 20),
            //* Sección de Albums (ListView vertical)
            DogsListview(),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.deleteMusic();
        },
      )
    );
  }
}
