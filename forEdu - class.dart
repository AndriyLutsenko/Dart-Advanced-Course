class Person {
  final String name;
  String surname;
  late String fullname = name + surname;
  late String test = fullname * 2;

  Person(this.name, this.surname) : this.fullname = name + surname {
    print(fullname);
  }
  Person.i2(String name, String surname)
      : this.name = name,
        this.surname = surname,
        this.fullname = name + surname {
    print(fullname);
  }
  Person.i3(this.name, this.surname) {
    print(fullname);
    print(test);
  }
}

void main() {
  Person i = Person("Андрій ", "Луценко");
  Person i2 = Person.i2("Андрій ", "Луценко");
  Person i3 = Person.i3("А ", "Л");
}
