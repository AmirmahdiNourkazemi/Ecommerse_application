import 'package:mobile_shop/data/model/varient.dart';
import 'package:mobile_shop/data/model/varient_type.dart';

class ProductVarient {
  VarientType varientType;
  List<Variant> varientList;
  ProductVarient(this.varientType, this.varientList);
}
