import 'utils/ope.dart' as ope;
import 'utils/limp_parens.dart' as limParens;
import 'utils/obt_orden.dart' as obtOrd;
import 'utils/resolv_ope.dart';

main(List<String> args) {
  //TODO: debe recibir numeros de 2 digitos

  // var s1 = [2, 3, 7, 20, 32, 43];
  // var s2 = [1, 7, 11];

  // var f = '9*3*4(2/7*3)';
  var f = '2*7*3+4(1+5(4+3*9)(1+4/2)+4)';

  resolverForm(f);
}

void resolverForm(String f) {
  List l2 = ope.convertStL(f);

  //  f = '3+4+5*3*4(2/4*4)';

  print(l2);
  Map m2 = obtOrd.obtOrden(l2);
  print(m2);
  List r2 = resolvOpe(m2, l2);
  print(r2);
  l2 = limParens.limpParentesis(r2, m2);
  print('despues de limpiar parentesis: $l2');

  // print(l2);
  // Map m3 = obtOrd.obtOrden(l2);
  // print(m3);
  // List r3 = resolvOpe(m3, l2);
  // print(r3);
  // l2 = limParens.limpParentesis(r3, m3);
  // print('despues de limpiar parentesis: $l2');

  // if (!l2.contains('(')) {
  //   // print('termnar');
  //   var result = new List();

  //   if (l2.contains('*') || l2.contains('/')) {
  //     result = ope.resolverMD(l2);
  //   }
  //   if (l2.contains('+') || l2.contains('-')) {
  //     result = ope.resolverSR(l2);
  //   }
  //   num r = result.first;

  //   print(r);
  // }
}
