import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void getCartId(Function callback) async {
  var url = Uri.parse(
      "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=ziskat_cart_id");
  var res = await http.get(url);
  print(res.body);
  if (res.statusCode == 200) {
    callback(res.body);
  }
}

void getCartIdWithProductId(Function callback, String idProduct) async {
  var url = Uri.parse(
      "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=ziskat_cart_id");
  var res = await http.get(url);
  print(res.body);
  if (res.statusCode == 200) {
    callback(idProduct, res.body);
  }
}

void getCartIdPlaceOrder(Function callback) async {
  var url = Uri.parse(
      "http://10.0.2.2/holes/dia_eshop/web/Admin/index.php?action=ziskat_cart_id");
  var res = await http.get(url);
  print(res.body);
  if (res.statusCode == 200) {
    callback(res.body);
  }
}
