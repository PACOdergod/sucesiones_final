import 'convertStL.dart';

main(List<String> args) {
  var f = '4 + 3(1 × 3(5 × 2)(3 + 5(4 ÷ 2) + 3 - 2(3 × 2) + 1) - 5)';
  // f.replaceAll(' ', '');
  print(f);
  List l2 = convertStL(f);
  print(l2);
  var o2 = obtOrden(l2);
  print(o2);
}

Map obtOrden(List f) {
  //TODO:verificar que los ( == )

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
      if (i == f.length - 1) {
        if (indexA.isEmpty) {
          break;
        } else if (indexA.isNotEmpty) {
          orden[auxi] = [indexA.last, i];
        }
      }

      if (f[i] == ')') {
        // print(indexA);
        if (f[i - 1] == ')') {
          continue;
        }
        if (indexA.isEmpty) {
          continue;
        }
        orden[auxi] = [indexA.last, i];
        auxi += 1;
        // print(orden);
        indexA.clear();
        // print(orden);
      }
      // print(orden);
    }
  }
  return orden;
}
