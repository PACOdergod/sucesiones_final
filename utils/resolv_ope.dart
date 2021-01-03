import 'ope.dart' as ope;

main(List<String> args) {
  var f = '(3+1+5)*3*4((2/4*4)/(2+5)3)';
  var m = {
    0: [0, 6],
    1: [12, 18],
    2: [20, 24]
  };

  List l2 = ope.convertStL(f);

  resolvOpe(m, l2);
}

List resolvOpe(Map map, List f) {
  // print(map.length);

  for (var i = map.length - 1; i >= 0; i--) {
    List v = map[i];

    int index1 = v.first;
    int index2 = v.last;

    var o = f.sublist(index1 + 1, index2);

    List b = [];

    for (var i = 0; i < o.length; i++) {
      b.add(' ');
    }

    var result = new List();

    if (o.contains('*') || o.contains('/')) {
      result = ope.resolverMD(o);
    }
    if (o.contains('+') || o.contains('-')) {
      result = ope.resolverSR(o);
    }
    num r = result.first;

    b.removeLast();
    b.add(r);

    f.replaceRange(index1 + 1, index2, b);
  }

  return f;
}
