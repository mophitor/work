import 'package:flutter/material.dart';
import 'package:login/pages/comic_page.dart';

class Comic {
  final List<String> images;
  Comic({required this.images});

  get length => null;
}

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
  final List<String> photo = [
    'https://avatars.mds.yandex.net/i?id=f5689c1c80e71febbe83e7aef9d3213ebaaeb7e7-9245471-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=e60419e26252c3da5bdc58c3ce0a5fba-6503757-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=265e784d802e1d94d6f3d35842cb2b2f701d2bde-11387523-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=912800c24fe0bc9564c059fa4f846cee5d3f4488-9069085-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=4be3e2bc2f50b31142a4c3819551651ed3391950-9461059-images-thumbs&n=13'
  ];
  final List<Comic> pages = [
    Comic(
      images: ['https://avatars.mds.yandex.net/i?id=f5689c1c80e71febbe83e7aef9d3213ebaaeb7e7-9245471-images-thumbs&n=13',
        'https://avatars.mds.yandex.net/i?id=9f0b30413fdb6d5a99a58c02ecee6ed5b2d01126-11004153-images-thumbs&n=13',
        'https://avatars.mds.yandex.net/i?id=183473b024a8d13b0d43358c4581dbda-5910758-images-thumbs&n=13',
        'https://avatars.mds.yandex.net/i?id=248fe9dfbdf04a7d0011d6ed84851ed6-5340221-images-thumbs&n=13',
        'https://avatars.mds.yandex.net/i?id=234f7751e2e302430882374d16283cc635d43107-4578267-images-thumbs&n=13'],
    ),
    
  ];

  static get title => null;

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
                  builder: (context) => DescriptionScreen(comic: comics[index], image: photo[index], page: pages[index]),
                ),
              );
            },
            child: Container(
              height: 500,
              width: 500,
              color: Colors.white,
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
                      builder: (context) => DescriptionScreen(comic: comics[index], image: photo[index], page: pages[index]),
                    ),
                  );
                },
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.white,
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
