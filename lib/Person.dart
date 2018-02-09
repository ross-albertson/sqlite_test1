

class Person {
  Person();
  int id;
  String firstName;
  String lastName;

  static final columns = ["id", "first_name", "last_name"];

  Map toMap() {
    Map map = {
      "first_name": firstName,
      "last_name": lastName,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  static fromMap(Map map) {
    Person person = new Person();
    person.id = map["id"];
    person.firstName = map["first_name"];
    person.lastName = map["last_name"];
        return person;
  }

  String toString() {
    return "$firstName $lastName";
  }
}