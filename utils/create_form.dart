// TODO: crear la funcion que regrese la formula de la sucesion

void operacion(List<int> l, int a) {
  // TODO: limpiar esta funcion
  String formula, formulaN;
  int n1, n2, n3;
  int cn;
  int x, y;
  String moduloN;

  for (var i = 0; i < a; i++) {
    // print(i);
    if (i == 0) {
      n1 = l[i];
    }
    if (i == 1) {
      n2 = l[i];
      y = n2;
      x = n1;

      int auxiliar = y - x;
      moduloN = operacion2(i);

      void operacionPosi(String m, int n, [int a = 0]) {
        if (a != 0) {
          formula = m + " ($a) " + " + $n";
        } else {
          formula = m + " + $n1";
        }
      }

      void operacionNeg(String m, int n, [int a = 0]) {
        if (a != 0) {
          formulaN = " $n - " + m + " ($a)";
        } else {
          formulaN = " $n1 - " + m;
        }
      }

      if (auxiliar == 1) {
        operacionPosi(moduloN, n1);
        operacionNeg(moduloN, n1);
      } else {
        operacionPosi(moduloN, n1, auxiliar);
        operacionNeg(moduloN, n1, auxiliar);
      }
      // print(formula);
      // print(formulaN);
    }
    if (i == 2) {
      cn = l[i];
      n3 = (i + 1);
      moduloN = operacion2(i);
      formula = "($cn - $formulaN ) / ($moduloN) = x";

      // print(formula);
      var form2 = limpiarF(n3, formula);
      // print(form2);
      // resolverForm(form2);
      // var fr = convertStL(form2);
      // print(fr);
    }
    // cambiarIndex(l[i], formula);
  }
}

String limpiarF(int n, String formula) {
  // TODO: terminar esta funcion
  // TODO: arreglar no acepta numeros de 2 digitos

  // f = formula
  //     .replaceAll('n', n.toString())
  //     .replaceAll('=', '')
  //     .replaceAll('x', '')
  //     .replaceAll(' ', '');
  // print(f);
  // return f;
}

// aumenta el modulo de n segun el numero que pasemos
String operacion2(int m) {
  int n;
  String modulo = "";
  for (var i = 0; i < m; i++) {
    n = (i + 1);
    var auxiliar = "(n - $n)";
    modulo += auxiliar;
  }
  // print(modulo);
  return modulo;
}
