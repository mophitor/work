import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> comics = ["1 Комикс", "2 Комикс", "3 Комикс", "4 Комикс", "5 Комикс"];
  final List<String> photo = ['https://avatars.mds.yandex.net/i?id=f5689c1c80e71febbe83e7aef9d3213ebaaeb7e7-9245471-images-thumbs&n=13', 'https://avatars.mds.yandex.net/i?id=e60419e26252c3da5bdc58c3ce0a5fba-6503757-images-thumbs&n=13', 'https://avatars.mds.yandex.net/i?id=265e784d802e1d94d6f3d35842cb2b2f701d2bde-11387523-images-thumbs&n=13', 'https://avatars.mds.yandex.net/i?id=912800c24fe0bc9564c059fa4f846cee5d3f4488-9069085-images-thumbs&n=13', 'https://avatars.mds.yandex.net/i?id=4be3e2bc2f50b31142a4c3819551651ed3391950-9461059-images-thumbs&n=13'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Комиксы Marvel"),
      ),
          body: Column(
            children: <Widget>[
              Expanded(child:
              ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: comics.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(height:1, color: Colors.white, margin: const EdgeInsets.symmetric(vertical: 15),),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(comic: comics[index], image: photo[index]),
                        ),
                      );
                    },
                    child: Container(
                      height: 500,
                      width: 500,
                      color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center (
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Image.network(photo[index]),
                            ),
                            Expanded(
                                child: Text(comics[index], style: const TextStyle(fontSize: 22))
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              ),
              Expanded(child:
              ListView.separated(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: comics.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(height:1, color: Colors.white, margin: const EdgeInsets.symmetric(vertical: 15),),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(comic: comics[index], image: photo[index]),
                        ),
                      );
                    },
                    child: Container(
                      height: 500,
                      width: 500,
                      color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center (
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Image.network(photo[index]),
                            ),
                            Expanded(
                                child: Text(comics[index], style: const TextStyle(fontSize: 22))
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              ),
            ],
          ),
        //
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  final String comic;
  final String image;

  const DescriptionScreen({Key? key, required this.comic, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(image, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Описание для $comic',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
