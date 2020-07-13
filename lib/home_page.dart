import 'connection_api.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_manipulation/model/model_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users;
  Connection con;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connection.getUser().then((map) {
      users = map;
      print('Tamanho: ');
      print(users.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      backgroundColor: Color(0xFF008B8B),
      body: SafeArea(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Color(0x5F9EA0),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
                trailing: Container(
                    child: IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Cell-Phone Number: '),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(users[index].phone),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
