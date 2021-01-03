import 'ope.dart' as ope;

main(List<String> args) {
  var f = '9*3*4(2/7*3)';
  List l2 = ope.convertStL(f);
  // print(l2);
  var o2 = obtOrden(l2);
  print(o2);
}

Map obtOrden(List f) {
  // print(f);
  // TODO: revisar que solo regrese los primeros parentesis que deben resolverse
  // TODO: cuando el ultimo elemento es un parentesis falla

  // los ( == )
  // cambiar el if == 0

  var indexA = [];
  int auxi = 0;
  Map orden = new Map();

  if (!f.contains('(')) {
    print('no hay parentesis');
    orden = {0: 0};
  }
  if (f.contains('(')) {
    // print('tiene');
    for (var i = 0; i < f.length; i++) {
      if (i == 0 && f[i] == '(') {
        indexA.add(0);
        continue;
      } else if (i == 0) {
        continue;
      }

      if (f[i] == '(') {
        indexA.add(i);
      }
      if (i == f.length - 1 && f[i - 1] != ')') {
        break;
      }

      if (f[i] == ')') {
        // print(indexA);
        if (f[i - 1] == ')') {
          continue;
        }
        orden[auxi] = [indexA.last, i];
        auxi += 1;
        // print(orden);
        indexA.clear();
        // print(orden);
      }
    }
  }
  return orden;
}
