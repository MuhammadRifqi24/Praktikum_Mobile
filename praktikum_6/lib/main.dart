import 'package:flutter/material.dart';

//Stack, ListView, and GridView
// Stack
/*void main() => runApp(MyApp());

class StaticBooks {
  static const String cdn = "https://cdn.syncfusion.com/";
  static const String path = "content/images/downloads/ebook/ebook-cover/";
  static const List<String> covers = [
    "visual-studio-for-mac-succinctly-v1.png",
  ];
}

class Succinctly extends StatelessWidget {
  List<Widget> stackScreen(double sizeX, double sizeY) {
    List<Widget> layout = <Widget>[];
    Container cover = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              StaticBooks.cdn + StaticBooks.path + StaticBooks.covers[0]),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
    layout.add(cover);
    final card = Positioned(
      top: sizeY / 1.45,
      left: sizeX / 4.2,
      child: Card(
        elevation: 15,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Succinctly Series'),
            ),
          ],
        ),
      ),
    );
    layout.add(card);
    Positioned button = Positioned(
      width: sizeX - sizeY / 10,
      bottom: sizeY / 40,
      left: sizeX / 12,
      child: ElevatedButton(
        // Or use ElevatedButton
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text('Browse collection'),
        onPressed: () {
          // Do something later...
        },
      ),
    );
    layout.add(button);
    return layout;
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
        child: Stack(
      children: stackScreen(sizeX, sizeY),
    ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.amber,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 26, fontStyle: FontStyle.italic),
        ),
        brightness: Brightness.dark,
      ),
    );
  }
}*/

//ListView
/*void main() => runApp(MyApp());

class Doc {
  String name;
  String description;
  DateTime expires;
  Doc(this.name, this.description, this.expires);
}

class Succinctly extends StatelessWidget {
  List<Doc> createDocs() {
    List<Doc> docs = <Doc>[];
    docs.add(Doc('Driver License', 'Florida driver license',
        DateTime.now().add(new Duration(days: 1825))));
    docs.add(Doc('Passport Ed', 'Ed\'s passport',
        DateTime.now().add(new Duration(days: 825))));
    docs.add(Doc('Passport John', 'John\'s passport',
        DateTime.now().add(new Duration(days: 2801))));
    docs.add(Doc('ID card', 'John\'s national ID card',
        DateTime.now().add(new Duration(days: 801))));
    return docs;
  }

  List<ListTile> showList() {
    List<ListTile> items = <ListTile>[];
    List<Doc> docs = createDocs();
    docs.forEach((doc) {
      items.add(ListTile(
        title: Text(doc.name),
        subtitle: Text(doc.description),
        leading: CircleAvatar(
          child: Icon(Icons.book),
          backgroundColor: Colors.lightBlueAccent,
        ),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: () => true,
      ));
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Documents'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.book_online),
          onPressed: () {
            print('New doc!');
          },
        ),
        body: Container(
          width: sizeX,
          height: sizeY,
          child: ListView(
            children: showList(),
          ),
        ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.amber,
        brightness: Brightness.dark,
      ),
    );
  }
}*/

//GridView
void main() => runApp(MyApp());

class StaticBooks {
  static const String cdn = "https://cdn.syncfusion.com/";
  static const String path = "content/images/downloads/ebook/ebook-cover/";
  static const List<String> covers = [
    "visual-studio-for-mac-succinctly-v1.png",
    "angular-testing-succinctly.png",
    "azure-devops-succinctly.png",
    "asp-net-core-3-1-succinctly.png",
    "angulardart_succinctly.png"
  ];
}

class Succinctly extends StatelessWidget {
  List<Widget> createGrid() {
    List<Widget> imgs = <Widget>[];
    Widget cImage;
    for (int i = 0; i <= StaticBooks.covers.length - 1; i++) {
      cImage = Container(
          child: Image.network(
              StaticBooks.cdn + StaticBooks.path + StaticBooks.covers[i]));
      imgs.add(cImage);
    }
    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Succinctly Books'),
        ),
        body: Container(
            width: sizeX,
            height: sizeY,
            child: GridView.count(
              children: createGrid(),
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 4.5,
              mainAxisSpacing: 5.5,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
            )));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.amber,
        brightness: Brightness.dark,
      ),
    );
  }
}
