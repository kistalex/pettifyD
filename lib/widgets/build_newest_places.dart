import 'package:flutter/material.dart';

import 'package:pettify/data.dart';
import 'package:pettify/widgets/place_widget.dart';

List<Place> pets = getPlaceList();

List<Widget> buildNewestPlaces() {
  List<Widget> list = [];
  for (var i = 0; i < pets.length; i++) {
    if (pets[i].newest) {
      list.add(PlaceWidget(place: pets[i], index: i));
    }
  }
  return list;
}
