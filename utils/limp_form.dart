import 'dart:collection';

import "package:test/test.dart";

// TODO: debe detectar numerosa de mas de un digito

List<dynamic> convertStL(String s) {
  List<dynamic> b = [];

  var i1 = new List();
  loop:
  for (var i = 0; i < s.length; i++) {
    if (int.tryParse(s[i]) is int) {
      //Convierte los numeros del string a num si se puede
      i1.add(i);
      String numero;
      num s1;
      int i2 = i;
      if (i == s.length - 1) {
        numero = s.substring(i1.first, i2 + 1);
        s1 = int.parse(numero);
        b.add(s1);
        i1.clear();
        break loop;
      }

      if (int.tryParse(s[i + 1]) is int) {
        i2++;
        continue loop;
      } else {
        // print(i1);
        numero = s.substring(i1.first, i2 + 1);
        s1 = int.parse(numero);
        b.add(s1);
        i1.clear();
      }
    } else if (s[i] == '×') {
      b.add('*');
    } else if (s[i] == '÷') {
      b.add('/');
    } else if (s[i] == ' ') {
      continue;
    } else {
      b.add(s[i]);
    }
  }
  return b;
}

main(List<String> args) {
  var f = '4116445 + 134848 - 6545448';
  List l = convertStL(f);
  for (var i in l) {
    print('el valor es: $i y su tipo es: ${i.runtimeType}');
  }
  print(l);
}
