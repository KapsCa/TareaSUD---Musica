import 'package:get/get.dart';
import '../../../data/models/song_model.dart';

class HomeController extends GetxController {
  
  // Lista para la sección "Favourite Songs"
  final favoriteSongsObs = <Song>[
    const Song(
      title: 'Yaar Naa Miley',
      artist: 'Faisley',
      duration: '04:03',
      album: 'Mix Album',
      imagePath: 'assets/images/cover-2.jpg',
    ),
    const Song(
      title: 'Duniya M',
      artist: 'Spatial Noises',
      duration: '03:51',
      album: 'Chill',
      imagePath: 'assets/images/cover-3.jpg',
    ),
    const Song(
      title: 'Soul Funk',
      artist: 'Groove Band',
      duration: '04:40',
      album: 'New Age',
      imagePath: 'assets/images/cover-4.jpg',
    ),
    const Song(
      title: 'X-MAS Sessions',
      artist: 'House Techno',
      duration: '03:15',
      album: 'Dubstep',
      imagePath: 'assets/images/cover-5.jpg',
    ),
    const Song(
      title: 'I Still Love You',
      artist: 'Holbein',
      duration: '03:22',
      album: 'Classic Remake',
      imagePath: 'assets/images/cover-6.jpg',
    ),
    const Song(
      title: 'Album Title',
      artist: 'Artist Name',
      duration: '05:10',
      album: 'Electro Pop',
      imagePath: 'assets/images/cover-7.jpg',
    ),
    const Song(
      title: 'DJ Music Festival',
      artist: 'DJ NOISE',
      duration: '04:00',
      album: 'City Night',
      imagePath: 'assets/images/cover-8.jpg',
    ),
    const Song(
      title: 'Neon Nova',
      artist: 'Luna Solstice',
      duration: '04:55',
      album: 'The Festival',
      imagePath: 'assets/images/cover-11.jpg',
    ),
  ].obs; 

  // Lista para la sección "Album" 
  final albumListObs = <Song>[
    const Song(
      title: 'aitbaar nahi karna...',
      artist: 'D.J. Karlx',
      duration: '04:40',
      album: 'Reggae Hits',
      imagePath: 'assets/images/cover-19.jpg',
    ),
    const Song(
      title: '04 - Yaar Naa Miley',
      artist: 'John Salle',
      duration: '06:00',
      album: 'New Edition',
      imagePath: 'assets/images/cover-1.jpg',
    ),
    const Song(
      title: 'Mere Dil Ki Duniya M',
      artist: 'Titania',
      duration: '08:00',
      album: 'Chill Music',
      imagePath: 'assets/images/cover-9.jpg',
    ),
    const Song(
      title: 'Faisley-Kamal K..',
      artist: 'Natalie Jazz',
      duration: '03:51',
      album: 'Black Tour',
      imagePath: 'assets/images/cover-13.jpg',
    ),
    const Song(
      title: 'Body and Soul',
      artist: 'Festival 2019',
      duration: '04:15',
      album: 'Jazz Fusion',
      imagePath: 'assets/images/cover-12.jpg',
    ),
    const Song(
      title: 'Let The Music Move You',
      artist: 'DJ Patrick',
      duration: '03:45',
      album: 'Mucis Fest',
      imagePath: 'assets/images/cover-14.jpg',
    ),
    const Song(
      title: 'Illusions',
      artist: 'The Artist',
      duration: '04:30',
      album: 'Neon Art',
      imagePath: 'assets/images/cover-15.jpg',
    ),
    const Song(
      title: 'Music Party',
      artist: 'DJ ONE',
      duration: '05:05',
      album: 'Retro Wave',
      imagePath: 'assets/images/cover-16.jpg',
    ),
    const Song(
      title: 'NEW ALBUM',
      artist: 'MARCUS PALOOZA',
      duration: '03:30',
      album: 'The New One',
      imagePath: 'assets/images/cover-17.jpg',
    ),
    const Song(
      title: 'MUSIC FEST',
      artist: 'HAVANA CLUB',
      duration: '04:00',
      album: 'Your Logo',
      imagePath: 'assets/images/cover-18.jpg',
    ),
    const Song(
      title: 'RAVE FESTIVAL',
      artist: 'LORE CITY',
      duration: '04:10',
      album: 'Rave Culture',
      imagePath: 'assets/images/cover-1O.jpg',
    ),
  ].obs; 

  
}