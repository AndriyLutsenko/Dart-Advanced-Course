// bool isNanCheck(double x) => x != x;
void main() {
  try {
    var x = 9;
    var y = 0;
    var a = x / y;
    var k = a - a;
    var o = 0 - a;
    var m = a + o;

    if (a == a && (a - a) != 0 && (a / a) != 1 && a == (a + 1)) {
      print("Бескінечність рівна бескінечності але ...");
    }
    if (k != k && k - k != 0 && (a + k).isNaN) {
      print("NaN не дорвнює саме собі і ще ...");
    }
    if (k.isNaN || k.isInfinite) {
      throw ZeroDiv(k);
      // ("Помилка ділення на нуль");
    }

    print(">>>> $a");
    print(">>>> $k");
    print(o);
  } on Exception {
    print("Обработка исключения в блоке on");
    // } on ZeroDiv {
    //   print("Помилка ділення на нуль");
  } catch (k, s) {
    print("Виникла помилка: $k");
    // print(s);
    // } finally {
    //   print("блок finally");
  }
  print("Вихід");
}

class ZeroDiv implements Exception {
  var value;
  ZeroDiv(this.value);
  @override
  String toString() => "Ділення на нуль";
}
