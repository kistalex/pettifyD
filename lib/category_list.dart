import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pettify/widgets/place_widget.dart';
import 'package:pettify/data.dart';

import 'widgets/build_filter.dart';

class CategoryList extends StatelessWidget {
  final Category category;

  CategoryList({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          (category == Category.walking
              ? "Прогулка"
              : category == Category.grooming
                  ? "Салоны по уоду"
                  : category == Category.doctor
                      ? "Ветеринарные клиники"
                      : "Зоомагазины"),
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_horiz,
              color: Colors.grey[800],
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          category == Category.walking
              ? Padding(
                  padding:
                      EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildFilter("Парки", false),
                      buildFilter("Кафе", false),
                      buildFilter("Дрессировка", false),
                    ],
                  ),
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: 1 / 1.55,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                children: getPlaceList()
                    .where((i) => i.category == category)
                    .map((item) {
                  return PlaceWidget(
                    place: item,
                    index: null,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
