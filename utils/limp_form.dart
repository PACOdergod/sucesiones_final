// TODO: debe detectar numerosa de mas de un digito

List<dynamic> convertStL(String s) {
  List<dynamic> b = [];

  for (var i = 0; i < s.length; i++) {
    if (int.tryParse(s[i]) is int) {
      //Convierte los numeros del string a num si se puede
      num s1 = int.parse(s[i]);
      // print(s1);
      b.add(s1);
    } else if (s[i] == '×') {
      b.add('*');
    } else if (s[i] == '÷') {
      b.add('/');
    } else if (s[i] == ' ') {
    } else {
      b.add(s[i]);
    }
  }
  return b;
}
