import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<int> getUID() async {
  var url = Uri.parse(
      "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=ziskat_uid");
  var res = await http.get(url);

  var json = convert.jsonDecode(res.body) as int;
  print(json);
  return 1;
}
