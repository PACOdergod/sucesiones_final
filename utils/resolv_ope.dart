import 'convertStL.dart';
import 'obt_orden.dart';
import 'ope.dart' as ope;

main(List<String> args) {
  var f = '4+3(1×3(5×2)(3+5(4÷2)+3-2(3×2)+1)-5)';
  List l2 = convertStL(f);
  print(l2);
  var o2 = obtOrden(l2);
  print(o2);

  resolvOpe(o2, l2);
}

List resolvOpe(Map map, List f) {
  // print(map.length);
  // TODO: el for debe ir en orden ascendente
  for (var i = map.length - 1; i >= 0; i--) {
    List v = map[i];
    // print(map[i]);

    int index1 = v.first;
    int index2 = v.last;

    List o = f.sublist(index1 + 1, index2);
    // print(o);

    List b = [];

    for (var i = 0; i < o.length; i++) {
      b.add(' ');
    }

    var result = new List();

    if (o.contains('*') || o.contains('/')) {
      // print('multi');
      result = ope.resolverMD(o);
    }
    if (o.contains('+') || o.contains('-')) {
      // print('suma');

      result = ope.resolverSR(o);
    }
    num r = result.first;

    b.removeLast();
    b.add(r);

    f.replaceRange(index1 + 1, index2, b);
  }
  // print(f);

  return f;
}
