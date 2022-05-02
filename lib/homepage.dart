import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pettify/counters.dart';
import 'package:pettify/data.dart';
import 'package:pettify/widgets/build_newest_places.dart';

import 'package:pettify/category_list.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/build_vet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> place = getPlaceList();

  // func viewDidLoad() {
  //   super.viewDidLoad()
  //   FirebaseNetworkSefvice.getAllData { dataWhichWeGot in
  //     Widget.update(with: dataWhichWeHot)
  //   }
  // }

  final userName = 'Саша';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Добрый день, $userName",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Хорошего дня",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Возможности",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPlaceCategory(Category.walking, getCountWalking(),
                          (Colors.orange[200])!),
                      buildPlaceCategory(Category.grooming, getCountGroomers(),
                          (Colors.blue[200])!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPlaceCategory(Category.doctor, getCountDoctors(),
                          (Colors.green[200])!),
                      buildPlaceCategory(
                          Category.shop, getCountShops(), (Colors.red[200])!),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Новые предложения",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildNewestPlaces(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Помощь рядом",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            Container(
              height: 130,
              margin: EdgeInsets.only(bottom: 16),
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () async {
                      const phoneNumber = "+8800-555-35-35";
                      const url = 'tel:$phoneNumber';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: buildVet("assets/images/vets/vet_clin.png",
                        "Какая-то клиника 1", "8800-555-35-35"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () async {
                      const phoneNumber = "+8800-555-35-35";
                      const url = 'tel:$phoneNumber';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: buildVet("assets/images/vets/vet_clin.png",
                        "Какая-то клиника 2", "8800-555-35-35"),
                  ),
                  buildVet("assets/images/vets/vet_clin.png", "Это Мама свин",
                      "8800-555-35-35"),
                  buildVet("assets/images/vets/vet_clin.png",
                      "А это брат Джордж", "8800-555-35-35"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlaceCategory(Category category, int total, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryList(category: category)),
          );
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: (category == Category.walking
              ? BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(
                    color: Colors.grey.shade50,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )
              : category == Category.grooming
                  ? BoxDecoration(
                      color: Colors.blue.shade50,
                      border: Border.all(
                        color: Colors.grey.shade50,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )
                  : category == Category.doctor
                      ? BoxDecoration(
                          color: Colors.green.shade50,
                          border: Border.all(
                            color: Colors.grey.shade50,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        )
                      : BoxDecoration(
                          color: Colors.red.shade50,
                          border: Border.all(
                            color: Colors.grey.shade50,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        )),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/icons/" +
                          (category == Category.walking
                              ? "dog-walking.png"
                              : category == Category.grooming
                                  ? "groomer.png"
                                  : category == Category.doctor
                                      ? "veterinarian.png"
                                      : "pet-shop.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category == Category.walking
                        ? "Прогулка"
                        : category == Category.grooming
                            ? "Груминг"
                            : category == Category.doctor
                                ? "Доктор"
                                : "Магазины",
                    style: Platform.isIOS
                        ? TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                  ),
                  Text(
                    "Доступны " +
                        (category == Category.walking
                            ? getCountWalking().toString()
                            : category == Category.grooming
                                ? getCountGroomers().toString()
                                : category == Category.doctor
                                    ? getCountDoctors().toString()
                                    : getCountShops().toString()),
                    style: Platform.isIOS
                        ? TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          )
                        : TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
