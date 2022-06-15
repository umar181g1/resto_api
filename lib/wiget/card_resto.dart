import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resto_api/ui/page_detail.dart';
import '../data/model/ResRestoran.dart';

class ListResto extends StatelessWidget {
  final Restaurant resto;

  const ListResto({required this.resto});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPageList.routeName,
          arguments: resto.id,
        );
      },
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 40, bottom: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                      tag: resto.pictureId,
                      child: Image.network(
                        "https://restaurant-api.dicoding.dev/images/medium/${resto.pictureId}",
                        height: 150,
                        width: 125,
                        fit: BoxFit.cover,
                      ))),
            ),
            Expanded(
              child: Container(
                height: 100,
                width: 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white70),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resto.name,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            resto.city,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(resto.rating.toString())
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
