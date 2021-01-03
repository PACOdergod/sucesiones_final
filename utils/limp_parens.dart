import "package:test/test.dart";

main(List<String> args) {
  // test("limpriar parentesis", () {
  //   // Arrange
  //   List<dynamic> expected = [3, '+', 4, '+', 5, '*', 3, '*', 4, '*', 2.0, ' '];

  //   // Act
  //   var actual = limpParentesis(f, map);

  //   // Asset
  //   expect(actual, expected);
  // });

  var a = limpParentesis(f2, map2);
  print(a);
}

List f = [3, '+', 4, '+', 5, '*', 3, '*', 4, '(', 2.0, ')'];

List f2 = [3, '+', 4, '+', 5, '*', 3, '*', 4, '(', 2.0, ')', '(', 7, ')', 3];
Map map2 = {
  0: [9, 11],
  1: [12, 14]
};

Map map = {
  0: [9, 11]
};

List limpParentesis(List f, Map map) {
  // TODO: quitar los () que no son necesarios

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
      int index = parenList[i];
      var actual = f[index];

      if (parenList[i] == largo) {
        if (actual == ')') {
          f.removeLast();
        }
        break loop;
      }
      if (i == 0 && actual == '(') {
        f.replaceRange(index, index + 1, [' ']);
        continue loop;
      }

      if (actual == '(') {
        var anterior = f[index - 1];

        // si tiene un parentesis anterio lo cambia por *
        // si tiene un numero lo cambia por *
        // si no lo elimina

        if (anterior is num) {
          f.replaceRange(index, index + 1, ['*']);
        } else if (anterior == ')') {
          f.replaceRange(index - 1, index + 1, [' ', '*']);
        } else {
          f.replaceRange(index, index + 1, [' ']);
        }
      }
      if (actual == ')') {
        var siguiente = f[index + 1];

        // si tiene parentesis siuiente lo dejara igual
        // si es un numero cambiara este por *
        // si no es ninguno lo eliminara
        // print('cierre');

        if (siguiente is num) {
          f.replaceRange(index, index + 1, ['*']);
        } else if (siguiente == '(') {
          f.replaceRange(index, index + 1, [')']);
        } else {
          f.replaceRange(index, index + 1, [' ']);
        }
      }
    }
  }
  f.removeWhere((element) => element == ' ');
  print(f);

  return f;
}
