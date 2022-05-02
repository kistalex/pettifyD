import 'package:pettify/data.dart';

List<Place> place = getPlaceList(); // async

// class CategoryCounter {
//   List<Place> place // in init

//   int getCategoryCount(Category category) {
//     place.where((pet) => pet.category == category).toList().length // при помощи функции where сортируем категории
//   }
// }

int getCountWalking() {
  //(Element element)
  int count = 0;
  for (var element in place) {
    if (element.category == Category.walking) {
      count++;
    }
  }
  return count;
}

int getCountDoctors() {
  int count = 0;
  for (var element in place) {
    if (element.category == Category.doctor) {
      count++;
    }
  }
  return count;
}

int getCountGroomers() {
  int count = 0;
  for (var element in place) {
    if (element.category == Category.grooming) {
      count++;
    }
  }
  return count;
}

int getCountShops() {
  int count = 0;
  for (var element in place) {
    if (element.category == Category.shop) {
      count++;
    }
  }
  return count;
}
