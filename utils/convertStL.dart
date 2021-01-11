// TODO: debe detectar numerosa de mas de un digito

List<dynamic> convertStL(String s) {
  List<dynamic> b = [];
  var aux = new List();

  for (var i = 0; i < s.length; i++) {
    //Convierte los numeros del string a num si se puede
    if (int.tryParse(s[i]) is int || s[i] == '.') {
      String numero;
      num s1;

      if (i == 0 && num.tryParse(s[i + 1]) == null) {
        aux.add(i);
        if (s[i + 1] == '.') {
          continue;
        }
        s1 = num.parse(s[i]);
        b.add(s1);
        continue;
      }

      if (num.tryParse(s[i + 1]) is int) {
        aux.add(i);
        continue;
      }

      if (num.tryParse(s[i + 1]) == null && aux.isNotEmpty) {
        if (s[i + 1] == '.') {
          continue;
        }
        numero = s.substring(aux.first, i + 1);
        print(numero);
        s1 = num.parse(numero);
        b.add(s1);
        aux.clear();
      }
      //
      else {
        s1 = num.parse(s[i]);
        b.add(s1);
      }
      continue;
      // print(s1);

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
  var f = '41.54 + 5(1×3(5454× 2)(3 + 5(4 ÷ 47.545) + 3 - 2(3 × 2) + 1) - 5)';
  List l = convertStL(f);
  // for (var i in l) {
  //   print('el valor es: $i y su tipo es: ${i.runtimeType}');
  // }
  print(l);
}
