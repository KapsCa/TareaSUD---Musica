import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../../../data/models/dog_model.dart';

// 1. Ya no necesitamos GetView<DogController> porque el estado es LOCAL del ítem.
//    Un StatelessWidget con una variable final RxBool funciona perfecto aquí.
class DogAnimatedItem extends StatelessWidget {
  // 2. Quitamos isExpanded del constructor.
  //    Cada tarjeta debe tener su propio estado interno, no venir de afuera.
  DogAnimatedItem({required this.dog, super.key});

  final BreedsDogs dog;

  // 3. Creamos la variable reactiva local.
  //    Al ser 'final', sobrevive a las reconstrucciones simples,
  //    pero cuidado: al hacer scroll fuera de pantalla, se reseteará (es normal en ListViews).
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(
          26,
          255,
          255,
          255,
        ), // Un fondo sutil para ver la tarjeta
        borderRadius: BorderRadius.circular(15),
      ),

      // 4. Obx escucha los cambios de 'isExpanded'
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Título
                Expanded(
                  child: Text(
                    dog.name ?? 'Raza desconocida',
                    style: AppStyles.title,
                  ),
                ),

                // 5. ¡Aquí está el botón que faltaba!
                IconButton(
                  icon: Icon(
                    // Cambiamos el icono según el estado
                    isExpanded.value ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    // Invertimos el valor (true -> false, false -> true)
                    isExpanded.value = !isExpanded.value;
                  },
                ),
              ],
            ),

            // 6. Usamos AnimatedSize para la magia de la altura automática
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn, // Tu curva elegida 🚀
              alignment: Alignment.topCenter, // Se expande hacia abajo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.description ?? 'Descripción desconocida',
                    style: AppStyles.dogsDescription,
                    // Si es true, null (todas las líneas). Si es false, solo 2.
                    maxLines: isExpanded.value ? null : 2,
                    overflow:
                        TextOverflow.fade, // Queda mejor que clip para texto
                  ),

                  // 7. Aquí mostramos la info extra SOLO si está expandido
                  if (isExpanded.value) ...[
                    const SizedBox(height: 15),
                    const Divider(color: Color.fromARGB(60, 255, 255, 255)),
                    const SizedBox(height: 10),
                    // Aquí irán tus filas de estadísticas (Peso, Vida, etc.)
                    _buildStatsRow(dog),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Un pequeño helper para organizar los datos extra
Widget _buildStatsRow(dynamic dog) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          Text(
            'Peso de machos de: ${dog.maleWeight.min} - ${dog.maleWeight.max} kg',
          ),
          Text(
            'Peso de hembras de: ${dog.femaleWeight.min} - ${dog.femaleWeight.max} kg',
          ),
          Text('Tiempo de vida: ${dog.life.min} - ${dog.life.max} años'),
          Text('Es hypolergenico?'),
          Switch(value: dog.hypoallergenic, onChanged: (value) {}),
        ],
      ),
      // _statItem("Hipoalerg.", dog.hypoallergenic == true ? "Sí" : "No"),
    ],
  );
}
