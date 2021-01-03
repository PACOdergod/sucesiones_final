import 'utils/ope.dart' as ope;
import 'utils/limp_parens.dart' as limParens;
import 'utils/obt_orden.dart' as obtOrd;
import 'utils/resolv_ope.dart';

main(List<String> args) {
  //TODO: debe recibir numeros de 2 digitos

  // var s1 = [2, 3, 7, 20, 32, 43];
  // var s2 = [1, 7, 11];

  // var f = '9*3*4(2/7*3)';
  var f = '4 + 3(1 × 3(5 × 2)(3 + 5(4 ÷ 2) + 3 - 2(3 × 2) + 1) - 5)';

  resolverForm(f);
}

void resolverForm(String f) {
  print('operacion a resolver: $f');
  // f.removeWhere((element) => element == ' ');

  List l2 = ope.convertStL(f);

  while (l2.contains('(')) {
    // print(l2);
    Map m2 = obtOrd.obtOrden(l2);
    // print(m2);
    List r2 = resolvOpe(m2, l2);
    // print(r2);
    l2 = limParens.limpParentesis(r2, m2);
    // print('despues de limpiar parentesis: $l2');
  }

  if (!l2.contains('(')) {
    // print('termnar');
    var result = new List();

    if (l2.contains('*') || l2.contains('/')) {
      result = ope.resolverMD(l2);
    }
    if (l2.contains('+') || l2.contains('-')) {
      result = ope.resolverSR(l2);
    }
    num r = result.first;

    print(r);
  }
}
