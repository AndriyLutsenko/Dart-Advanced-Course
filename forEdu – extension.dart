extension on int {
  int get square => this * this; // квадрат числа
  int get cube => this * this * this; // число в кубі

  num pow(int n) {
    num result = 1;
    for (int i = 0; i < n.abs(); i++) {
      result *= this;
    }
    if (n < 0) result = 1 / result;
    return result;
  }
}

void main() {
  int number = 2;
  print(number.square); // 4
  print(number.cube); // 8
  print(number.pow(5)); //32
}
