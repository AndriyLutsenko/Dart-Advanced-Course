void doAsync() async {
    print("Початок асинхронної функції");
    String message = await getMessage();
    print(message);
    print("Завершення асинхронної функції");
}

Future<String> getMessage() {
  return Future.delayed(Duration(seconds: 3), () => "! Асинхронна операція");
}

int doSync()=> 3 + 4;

void main (){
print("Початок функции main");
  doAsync();
  Future(()=>print("Незаблоковані \"інші\" операції"));
  int a=doSync();
  print("Незаблоковані \"інші\" операції (a=$a)");
  }
