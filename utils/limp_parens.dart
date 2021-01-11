import 'convertStL.dart';
import 'obt_orden.dart' as obtOrd;

main(List<String> args) {
  var f = '(  2)2*7*3+4(1+5(    9)(    2)+4)';
  List f1 = convertStL(f);
  var m = obtOrd.obtOrden(f1);
  print(f1);
  // print(m);

  var a = limpParentesis(f1, m);
  print(a);
}

List limpParentesis(List f, Map map) {
  // TODO: dejar parentesis cuando el numero interior
  // sea negativo

  var parenList = [];

  map.forEach((key, value) {
    value.forEach((e) => parenList.add(e));
  });

  int largo = f.length - 1;

  if (!f.contains('(')) {
    print('no hay parentesis');
    return f;
  } else {
    loop:
    for (var i = 0; i < parenList.length; i++) {
      int actualIndex = parenList[i];
      var actualList = f[actualIndex];
      // print(actualIndex);

      if (parenList[i] == largo) {
        if (actualList == ')') {
          f.removeLast();
        }
        break loop;
      }
      if (actualIndex == 0 && actualList == '(') {
        f.replaceRange(actualIndex, actualIndex + 1, [' ']);
        continue loop;
      }

      if (actualList == '(') {
        var anterior = f[actualIndex - 1];

        // si tiene un parentesis anterio lo cambia por *
        // si tiene un numero lo cambia por *
        // si no lo elimina

        if (anterior is num) {
          f.replaceRange(actualIndex, actualIndex + 1, ['*']);
        } else if (anterior == ')') {
          f.replaceRange(actualIndex - 1, actualIndex + 1, [' ', '*']);
        } else {
          f.replaceRange(actualIndex, actualIndex + 1, [' ']);
        }
      }
      if (actualList == ')') {
        var siguiente = f[actualIndex + 1];

        // si tiene parentesis siuiente lo dejara igual
        // si es un numero cambiara este por *
        // si no es ninguno lo eliminara
        // print('cierre');

        if (siguiente is num) {
          f.replaceRange(actualIndex, actualIndex + 1, ['*']);
        } else if (siguiente == '(') {
          f.replaceRange(actualIndex, actualIndex + 1, [')']);
        } else {
          f.replaceRange(actualIndex, actualIndex + 1, [' ']);
        }
      }
    }
  }
  f.removeWhere((element) => element == ' ');
  // print(f);

  return f;
}
