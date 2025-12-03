import 'package:flutter/material.dart';
import '../../../core/values/values.dart';
import '../../../data/models/dog_model.dart';

class DogsListItem extends StatelessWidget {
  const DogsListItem({super.key, required this.dog});

  final BreedsDogs dog;

  @override
  Widget build(BuildContext context) {
    int lineas = 2;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          // const SizedBox(width: 10),
          // CircleAvatar(
          //   backgroundImage: NetworkImage(dog.image),
          //   radius: 35,
          // ),
          // const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dog.name!, style: AppStyles.title),
                Text(
                  dog.description!,
                  style: AppStyles.dogsDescription,
                  maxLines: lineas,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(179, 255, 255, 255),
            ),
            onPressed: () {
              lineas = 4;
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
