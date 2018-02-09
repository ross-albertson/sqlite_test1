part of 'main.dart';

class NameList extends StatefulWidget {
  _NameListState createState() => new _NameListState();
}

class _NameListState extends State<NameList> {
  List<Widget> nameList = new List();

  Future<Null> getList() async {
    nameList = await Repository.generateList();
  }

  Widget build(BuildContext context) {
    getList();
    return new MaterialApp(
      title: "Name List",
      theme: new ThemeData(primarySwatch: Colors.cyan),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Updated Name List"),
        ),
        body: new ListView(
          children: nameList,
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: new Icon(Icons.fast_rewind),
        ),
      ),
    );
  }
}

class Repository {
  static Future<List<Widget>> generateList() async {
    List<Widget> list = new List();
    DatabaseClient db = new DatabaseClient();
    await db.create();
    List people = await db.fetchEveryone();
    people.forEach((person) {
 //     print("$person");
      ListTile listTile = new ListTile(
        leading: new CircleAvatar(
          child: new Text("${person.firstName[0]}${person.lastName[0]}"),),
        title: new Text("$person"),
      );
      list.add(listTile);
    });
    await db.close();
    return list;
  }
}