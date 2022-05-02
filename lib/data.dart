import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

enum Category { walking, grooming, doctor, shop }

// extension ParseToString on Category {
//   String toShortString() {
//     return this.toString().split('.').last;
//   }
// }

// class CategoryMapper {
//   static Category mapToCategory(String stringCategory) {
//     for (var value in Category.values) {
//       if (stringCategory == value.toShortString()) {
//         return value;
//       }
//     }
//     return Category.walking;
//   }
// }

class Place {
  final String name;
  final String location;
  final String distance;
  final String condition;
  final String description;
  final Category category;
  final String imageUrl;
  final bool favorite;
  final bool newest;
  final String longitude;
  final String latitude;

  Place(
      this.name,
      this.location,
      this.distance,
      this.condition,
      this.description,
      this.category,
      this.imageUrl,
      this.favorite,
      this.newest,
      this.longitude,
      this.latitude);
}

// FirebaseNe

// List<Category> getCategoriesFromFirebase() async {
//   FirebaseFirestore.instance.getAllData await {
//     notifyMainScreenAboutNewData()
//   }
// }

List<Place> getPlaceList() {
  return <Place>[
    Place("Розмарин", "Москва", "2.5", "Кафе", "description", Category.walking,
        "assets/images/parks/pet-love-1.png", false, true, "111", "111"),
    Place(
        "Красногвардейские пруды",
        "Стрельбищенский переулок",
        "1.2",
        "Парк",
        "kuku",
        Category.walking,
        "assets/images/parks/park.png",
        false,
        false,
        "111",
        "111"),
    Place(
        "Площадка во дворе",
        "ул.Антонова - Овсеенко",
        "2.5",
        "Дрессировка",
        "kuku",
        Category.walking,
        "assets/images/parks/trainer.png",
        true,
        true,
        "111",
        "111"),
    Place(
        "Милорд",
        "Земляной вал, 21/2",
        "2.5",
        "Салон",
        "kuku",
        Category.grooming,
        "assets/images/groomers/grooming-1.png",
        false,
        false,
        "111",
        "111"),
    Place("Центр", "Цветной б-р д11", "2.5", "Клиника", "kuku", Category.doctor,
        "assets/images/vets/vet_clin.png", false, false, "111", "111"),
    Place(
        "Бетховен, зоомагазин",
        "Пресненская набережная, 2",
        "2.5",
        "Магазин",
        "kuku",
        Category.shop,
        "assets/images/shops/pet-shop_beth.png",
        true,
        true,
        "111",
        "111"),
  ];
}
