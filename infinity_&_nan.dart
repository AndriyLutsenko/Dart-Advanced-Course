import 'dart:math';

void main() {
  // try {
  var x = 9;
  var y = 0;
  var z = x / y;
  var k = z - z;
  var o = k - z;
  var m = z + o;
  if (k.isNaN || k.isInfinite) {
    throw ("Помилка ділення на нуль");
  }
  print(">>>> $z");
  print(">>> $k");
  print(o);
  print(m);
  // } catch (e) {
  //   print("Виникла помилка $e");
  // } finally {
  //   print("блок finally");
  // }
  // print("Вихід");
}
