import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call API Test"),
        backgroundColor: Colors.green,
      ),
      // body: ListView.builder(
      //   itemCount: users.length,
      //   itemBuilder: (context, index) {
      //     final user = users[index];
      //     final userTitle = user['name']['title'];
      //     final userFirst = user['name']['first'];
      //     final userLast = user['name']['last'];
      //     final userFullName = '$userTitle $userFirst $userLast';
      //     final email = user['email'];
      //     final avatarUrl = user['picture']['thumbnail'];
      //     return ListTile(
      //       leading: ClipRRect(
      //         borderRadius: BorderRadius.circular(100),
      //         child: Image.network(avatarUrl),
      //       ),
      //       title: Text(email),
      //       subtitle: Text(user['cell']),
      //       tileColor: Colors.amberAccent,
      //     );
      //   },
      // ),

      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(users.length, (index) {
          final user = users[index];
          final userTitle = user['name']['title'];
          final userFirst = user['name']['first'];
          final userLast = user['name']['last'];
          final userFullName = '$userTitle $userFirst $userLast';
          final email = user['email'];
          final avatarUrl = user['picture']['large'];
          return Container(
              child: Card(
            //color: Colors.deepPurpleAccent,
            color: Colors.grey[50],
            shadowColor: Colors.black,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.green[500],
                radius: 48,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl), //NetworkImage
                  radius: 42,
                ), //CircleAvatar
              ), //CircleAvatar
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  userFullName,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ));
        }),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        backgroundColor: Colors.green,
        child: const Icon(Icons.supervised_user_circle),
      ),
    );
  }

  void fetchUser() async {
    print("fetching user data");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}
