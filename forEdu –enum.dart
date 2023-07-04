enum OrderStatus {
  open(100),
  confirmed(200),
  completed(300),
  cancelled(400),
  test(333333);

  final int progress;
  const OrderStatus(this.progress);
  void display() => print(OrderStatus);
  void testDisplay() => print(this.progress);
  bool operator <(OrderStatus status) => progress < status.progress;
  bool operator >(OrderStatus status) => progress > status.progress;
}

void main() {
  OrderStatus.test.testDisplay();
  OrderStatus status = OrderStatus.open;
  status.display();
  status.testDisplay();
  if (status < OrderStatus.completed) {
    print('ще ні');
  }
}
