void main() {
  Worker bob = Worker("123a", "Bob", "Google");
  Worker bob1 = Worker(123, "Bob1", "Google1");
  bob.display();
  bob1.display();
}

class Person<T> {
  T id; // ідентифікатор користувача
  String name;
  Person(this.id, this.name);

  void display() => print("id: $id \t name: $name");
}

class Worker extends Person<dynamic> {
  String company;
  Worker(super.id, super.name, this.company);
  @override
  void display() {
    super.display();
    print("Works in $company");
  }
}

class Meneger extends Worker {
  Meneger(super.id, super.name, super.company);
}
