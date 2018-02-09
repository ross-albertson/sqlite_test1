part of 'main.dart';

class NameEntry extends StatefulWidget {
  _NameEntryState createState() => new _NameEntryState();
}

class _NameEntryState extends State<NameEntry> {
  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();

  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Main Page",
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Add Name"),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: firstNameController,
                  decoration: new InputDecoration(labelText: "First Name:"),
                ),
                new TextField(
                  controller: lastNameController,
                  decoration: new InputDecoration(labelText: "Last Name:"),
                ),
                new IconButton(
                    icon: new Icon(Icons.play_arrow),
                    onPressed: () async {
                      try {

                        DatabaseClient db = new DatabaseClient();
                        await db.create();
                        Person person = new Person();
                        person.firstName = firstNameController.text;
                        person.lastName = lastNameController.text;
                        person = await db.insertPerson(person);
                        await db.close();

                        firstNameController.clear();
                        lastNameController.clear();
                        Navigator.pushNamed(context, "/list");
                      } catch (e) {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ErrorPage(errorMessage: "$e")));
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
