import 'package:flutter/material.dart';
//Navigation Widgets

//Succinctly books app
//Listing 1

/*void main() => runApp(MyApp());

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
  static const List<String> titles = [
    "Visual Studio for Mac Succinctly",
    "Angular Testing Succinctly",
    "Azure DevOps Succinctly",
    "ASP.NET Core 3.1 Succinctly",
    "AngularDart Succinctly"
  ];
}

class Succinctly extends StatelessWidget {
  final String book;
  final String title;
  Succinctly({
    required this.book,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(StaticBooks.cdn + StaticBooks.path + book),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book_online),
        onPressed: () {
          print('Awesome book!');
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(
        book: StaticBooks.covers[0],
        title: StaticBooks.titles[0],
      ),
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

//listing 2

/*void main() => runApp(MyApp());

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

  static const List<String> titles = [
    "Visual Studio for Mac Succinctly",
    "Angular Testing Succinctly",
    "Azure DevOps Succinctly",
    "ASP.NET Core 3.1 Succinctly",
    "AngularDart Succinctly"
  ];
}

class Succinctly extends StatelessWidget {
  final String book;
  final String title;
  Succinctly({
    required this.book,
    required this.title,
  });
  PopupMenuItem<String> bookItem(item) {
    return PopupMenuItem<String>(
      child: Text(item),
      value: item,
    );
  }

  List listBooks() {
    return StaticBooks.titles.map((String item) {
      return bookItem(item);
    }).toList();
  }

  List<Widget> popupMenuButton() {
    return <Widget>[
      PopupMenuButton(
        icon: Icon(Icons.book),
        itemBuilder: (BuildContext context) {
          return StaticBooks.titles.map((String item) {
            return bookItem(item);
          }).toList();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: popupMenuButton(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(StaticBooks.cdn + StaticBooks.path + book),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book_online),
        onPressed: () {
          print('Awesome book!');
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(
        book: StaticBooks.covers[0],
        title: StaticBooks.titles[0],
      ),
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

//Push and pop
//Listing 1
/*void main() => runApp(MyApp());

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
  static const List<String> titles = [
    "Visual Studio for Mac Succinctly",
    "Angular Testing Succinctly",
    "Azure DevOps Succinctly",
    "ASP.NET Core 3.1 Succinctly",
    "AngularDart Succinctly"
  ];
}

class Succinctly extends StatelessWidget {
  final String book;
  final String title;
  Succinctly({
    required this.book,
    required this.title,
  });
  PopupMenuItem<String> bookItem(item) {
    return PopupMenuItem<String>(
      child: Text(item),
      value: item,
    );
  }

  List listBooks() {
    return StaticBooks.titles.map((String item) {
      return bookItem(item);
    }).toList();
  }

  List<Widget> popupMenuButton(BuildContext context) {
    return <Widget>[
      PopupMenuButton(
        icon: Icon(Icons.book),
        itemBuilder: (context) {
          return StaticBooks.titles.map((String item) {
            return bookItem(item);
          }).toList();
        },
        onSelected: (value) => showBook(context, value),
      ),
    ];
  }

  void showBook(BuildContext context, String mItem) {
    String title = "";
    String cover = "";
    if (mItem == StaticBooks.titles[0]) {
      cover = StaticBooks.covers[0];
      title = StaticBooks.titles[0];
    } else if (mItem == StaticBooks.titles[1]) {
      cover = StaticBooks.covers[1];
      title = StaticBooks.titles[1];
    } else if (mItem == StaticBooks.titles[2]) {
      cover = StaticBooks.covers[2];
      title = StaticBooks.titles[2];
    } else if (mItem == StaticBooks.titles[3]) {
      cover = StaticBooks.covers[3];
      title = StaticBooks.titles[3];
    } else if (mItem == StaticBooks.titles[4]) {
      cover = StaticBooks.covers[4];
      title = StaticBooks.titles[4];
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Succinctly(
                  book: cover,
                  title: title,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: popupMenuButton(context),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(StaticBooks.cdn + StaticBooks.path + book),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book_online),
        onPressed: () {
          print('Awesome book!');
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(
        book: StaticBooks.covers[0],
        title: StaticBooks.titles[0],
      ),
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
}
*/

//Bottom navigation bar
//listing 1
/*void main() => runApp(MyApp());

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
  static const List<String> titles = [
    "Visual Studio for Mac Succinctly",
    "Angular Testing Succinctly",
    "Azure DevOps Succinctly",
    "ASP.NET Core 3.1 Succinctly",
    "AngularDart Succinctly"
  ];
}

class Succinctly extends StatelessWidget {
  final String book;
  final String title;
  Succinctly({
    required this.book,
    required this.title,
  });
  void showBook(BuildContext context, String mItem) {
    String title = "";
    String cover = "";
    if (mItem == StaticBooks.titles[0]) {
      cover = StaticBooks.covers[0];
      title = StaticBooks.titles[0];
    } else if (mItem == StaticBooks.titles[1]) {
      cover = StaticBooks.covers[1];
      title = StaticBooks.titles[1];
    } else if (mItem == StaticBooks.titles[2]) {
      cover = StaticBooks.covers[2];
      title = StaticBooks.titles[2];
    } else if (mItem == StaticBooks.titles[3]) {
      cover = StaticBooks.covers[3];
      title = StaticBooks.titles[3];
    } else if (mItem == StaticBooks.titles[4]) {
      cover = StaticBooks.covers[4];
      title = StaticBooks.titles[4];
    }
    print(cover);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Succinctly(
                  book: cover,
                  title: title,
                )));
  }

  static int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        currentIndex: _index,
        onTap: (value) {
          String _title = StaticBooks.titles[value];
          _index = value;
          showBook(context, _title);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Visual Studio Mac',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'Ang. Testing',
            icon: Icon(Icons.book_online),
          ),
          BottomNavigationBarItem(
            label: 'Azure DevOps',
            icon: Icon(Icons.book_online_outlined),
          ),
          BottomNavigationBarItem(
            label: 'ASP.NET Core',
            icon: Icon(Icons.book_online_rounded),
          ),
          BottomNavigationBarItem(
            label: 'AngularDart',
            icon: Icon(Icons.book_online_sharp),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(StaticBooks.cdn + StaticBooks.path + book),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book_online),
        onPressed: () {
          print('Awesome book!');
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(
        book: StaticBooks.covers[0],
        title: StaticBooks.titles[0],
      ),
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

//
//listing 1
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

  static const List<String> titles = [
    "Visual Studio for Mac Succinctly",
    "Angular Testing Succinctly",
    "Azure DevOps Succinctly",
    "ASP.NET Core 3.1 Succinctly",
    "AngularDart Succinctly"
  ];
}

class Succinctly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Succinctly Books'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.book), text: 'VSM'),
              Tab(icon: Icon(Icons.book_online), text: 'AT'),
              Tab(icon: Icon(Icons.book_online_outlined), text: 'AZ'),
              Tab(icon: Icon(Icons.book_online_rounded), text: 'ASP'),
              Tab(icon: Icon(Icons.book_online_sharp), text: 'AD'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(StaticBooks.cdn +
                      StaticBooks.path +
                      StaticBooks.covers[0]),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(StaticBooks.cdn +
                      StaticBooks.path +
                      StaticBooks.covers[1]),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(StaticBooks.cdn +
                      StaticBooks.path +
                      StaticBooks.covers[2]),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(StaticBooks.cdn +
                      StaticBooks.path +
                      StaticBooks.covers[3]),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(StaticBooks.cdn +
                      StaticBooks.path +
                      StaticBooks.covers[4]),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
