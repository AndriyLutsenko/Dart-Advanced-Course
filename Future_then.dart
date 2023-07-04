import 'dart:async';
// void A()async{print("A s1");
//             await Future(()=>print("A aF"));
//              print("A s2");}
// Future<void> B()async{print("B s1");
//              Future(()=>print("B F"));
//              print("B s2");}

void main() {
 print("1  synchro 1");
 Future(()=> print("5  event queue 1")).then((_)=> print("6  synchro after event 1"));
  // A();
  // B();
 Future(()=> print("7  event queue 2")).then((_)=> Future(() => print("14 event queue - next iteration 2")));
 // Future.delayed(Duration(milliseconds: 1), ()=> print("??? Future.delayed 1ms (event queue)"));
 Future(()=> print("8  event queue 3")).then((_)=> Future.microtask(()=>print("9  microtask after event 3")));
 Future(()=> print("10 event queue 4")).then((_)=> Future(()=>scheduleMicrotask(()=>print("15 event queue - scheduleMicrotask in next iteration 3"))));
 Future(()=> print("11 event queue 5")).then((_)=> scheduleMicrotask(()=>print("12 microtask after event 5")));
 Future.microtask(()=> print("3  microtask 1")).then((_) => Future(()=>print("13 event queue - next iteration 1")));
 scheduleMicrotask(()=> print("4  microtask 2"));
 Future.delayed(Duration(seconds: 1), ()=> print("??? Future.delayed 1s (event queue)"));
 print("2  synchro 2");
}
