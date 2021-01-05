// TODO: debe detectar numeros decimales

List<dynamic> convertStL(String s) {
  List<dynamic> b = [];

  var i1 = new List();

  loop:
  for (var i = 0; i < s.length; i++) {
    if (int.tryParse(s[i]) is int) {
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
  var f = '4116445 + 134848(8484+5848(4/65465)) - 6545448';
  List l = convertStL(f);
  for (var i in l) {
    print('el valor es: $i y su tipo es: ${i.runtimeType}');
  }
  print(l);
}
