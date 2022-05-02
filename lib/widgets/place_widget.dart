import 'package:flutter/material.dart';
import 'package:pettify/data.dart';
import 'package:pettify/place_detail.dart';

class PlaceWidget extends StatelessWidget {
  final Place place;
  final int? index;

  PlaceWidget({Key? key, required this.place, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaceDetail(place: place)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: (Colors.grey[200])!,
            width: 1,
          ),
        ),
        margin: EdgeInsets.only(
            right: index != null ? 16 : 0,
            left: index == 0 ? 16 : 0,
            bottom: 16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: place.imageUrl,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(place.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(12),
                  //     child: Container(
                  //       height: 30,
                  //       width: 30,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: place.favorite ? Colors.red[400] : Colors.white,
                  //       ),
                  //       child: Icon(
                  //         Icons.favorite,
                  //         size: 16,
                  //         color: place.favorite ? Colors.white : Colors.grey[300],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: place.condition == "Парк"
                          ? Colors.orange[100]
                          : place.condition == "Дрессировка"
                              ? Colors.red[100]
                              : Colors.blue[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      place.condition,
                      style: TextStyle(
                        color: place.condition == "Парк"
                            ? Colors.orange
                            : place.condition == "Дрессировка"
                                ? Colors.red
                                : Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    place.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[600],
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        child: Text(
                          place.location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "(" + place.distance + "km)",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
