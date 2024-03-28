import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/WelcomeScreen.dart';

class Comic {
  final List<String> images;
  Comic({required this.images});

  get length => null;
}

class DescriptionScreen extends StatelessWidget {
  final String comic;
  final String image;
  final Comic images;

  const DescriptionScreen(
      {super.key, required this.comic, required this.image, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic),
      ),
      body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
                children: <Widget>[
                  Text(
                      'Название $comic'
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 550),
                    child: PageView.builder(
                        itemCount: image.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(image, fit: BoxFit.cover
                            ),
                          );
                        }
                    ),
                  ),
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 50),
                    child: ListView(
                      children: [
                        Text(
                            'Описание $comic и подробная информация о нем, Описание $comic и подробная информация о нем, Описание $comic и подробная информация о нем, Описание $comic и подробная информация о нем, Описание $comic и подробная информация о нем, '
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 100,
                    color: CupertinoColors.systemGrey,
                  ),
                  Text(
                    'Подробности о $comic и другая информация, Подробности о $comic и другая информация, Подробности о $comic и другая информация, Подробности о $comic и другая информация, '
                  )
                ]
            )
      ),
    );
  }
}
