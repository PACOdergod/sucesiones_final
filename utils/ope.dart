// main(List<String> args) {
//   var s = '3-1+2*8/5*4/4*2*4*6';

//   List ls = convertStL(s);

//   List rs = resolverMD(ls);
//   print(rs);
//   // print(resolverSR(rs));

//   var r = resolverSR(rs);
//   print(r);
// }

List resolverMD(List b) {
  for (var i = 0; i < b.length; i++) {
    if (b[i] == '*') {
      // print(b[i]);
      // print(i);
      var indexSig, indexAnt;
      indexSig = b.indexWhere(
          (element) =>
              element.runtimeType == int || element.runtimeType == double,
          i);
      var listAux = b.sublist(0, i);
      indexAnt = listAux.lastIndexWhere((element) =>
          element.runtimeType == int || element.runtimeType == double);

      num numSig = b[indexSig];
      num numAnt = b[indexAnt];
      // print(numAnt);
      // print(numSig);

      num resultado = numSig * numAnt;
      // print(resultado);
      // print("en el index $i se hara $numAnt * $numSig = $resultado");

      b.replaceRange(indexAnt, indexSig + 1, [' ', ' ', resultado]);
      // print(b);
    }
    if (b[i] == '/') {
      // print(b[i]);
      // print(i);
      var indexSig, indexAnt;
      indexSig = b.indexWhere(
          (element) =>
              element.runtimeType == int || element.runtimeType == double,
          i);
      var listAux = b.sublist(0, i);
      indexAnt = listAux.lastIndexWhere((element) =>
          element.runtimeType == int || element.runtimeType == double);

      num numSig = b[indexSig];
      num numAnt = b[indexAnt];
      // print(numAnt);
      // print(numSig);

      num resultado = numAnt / numSig;
      // print(resultado);
      // print("en el index $i se hara $numAnt / $numSig = $resultado");

      b.replaceRange(indexAnt, indexSig + 1, [' ', ' ', resultado]);

      // print(b);
    }
  }
  b.removeWhere((element) => element == ' ');

  // print(b);
  return b;
}

List resolverSR(List b) {
  for (var i = 0; i < b.length; i++) {
    if (b[i] == '+') {
      var indexSig, indexAnt;
      indexSig = b.indexWhere(
          (element) =>
              element.runtimeType == int || element.runtimeType == double,
          i);
      var listAux = b.sublist(0, i);
      indexAnt = listAux.lastIndexWhere((element) =>
          element.runtimeType == int || element.runtimeType == double);

      num numSig = b[indexSig];
      num numAnt = b[indexAnt];

      num resultado = numSig + numAnt;

      b.replaceRange(indexAnt, indexSig + 1, [' ', ' ', resultado]);
    }
    if (b[i] == '-') {
      var indexSig, indexAnt;
      indexSig = b.indexWhere(
          (element) =>
              element.runtimeType == int || element.runtimeType == double,
          i);
      var listAux = b.sublist(0, i);
      indexAnt = listAux.lastIndexWhere((element) =>
          element.runtimeType == int || element.runtimeType == double);

      num numSig = b[indexSig];
      num numAnt = b[indexAnt];

      num resultado = numAnt - numSig;

      b.replaceRange(indexAnt, indexSig + 1, [' ', ' ', resultado]);
    }
  }
  b.removeWhere((element) => element == ' ');

  // print(b);
  return b;
}
