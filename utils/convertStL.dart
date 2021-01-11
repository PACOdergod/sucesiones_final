// TODO: debe detectar numerosa de mas de un digito

List<dynamic> convertStL(String s) {
  List<dynamic> b = [];
  var aux = new List();

  for (var i = 0; i < s.length; i++) {
    //Convierte los numeros del string a num si se puede
    if (int.tryParse(s[i]) is int) {
      String numero;
      num s1;

      if (i == 0 && int.tryParse(s[i + 1]) == null) {
        s1 = int.parse(s[i]);
        b.add(s1);
        continue;
      }
      if (int.tryParse(s[i + 1]) is int) {
        aux.add(i);
        print(aux);

        continue;
      }
      if (int.tryParse(s[i + 1]) == null && aux.isNotEmpty) {
        numero = s.substring(aux.first, i + 1);
        print(numero);
        s1 = int.parse(numero);
        b.add(s1);
        aux.clear();
      }

      if (int.tryParse(s[i - 1]) is int) {
        continue;
      } else {
        s1 = int.parse(s[i]);
        b.add(s1);
      }
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
  var f = '454 + 543(1×345(5× 2)(3 + 5(4 ÷ 2554.545) + 3 - 2(3 × 2) + 1) - 5)';
  List l = convertStL(f);
  for (var i in l) {
    print('el valor es: $i y su tipo es: ${i.runtimeType}');
  }
  print(l);
}
