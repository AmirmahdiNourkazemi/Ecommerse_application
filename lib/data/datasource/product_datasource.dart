import 'package:mobile_shop/data/model/product.dart';
import 'package:mobile_shop/di/di.dart';
import 'package:dio/dio.dart';
import 'package:mobile_shop/util/api_exeption.dart';

abstract class IProductDatasource {
  Future<List<Products>> getProducts();
  Future<List<Products>> getHotest();
  Future<List<Products>> getBestSeller();
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Products>> getProducts() async {
    try {
      var respones = await _dio.get('collections/products/records');
      return respones.data['items']
          .map<Products>((jsonObject) => Products.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown erorr', 0);
    }
  }

  @override
  Future<List<Products>> getHotest() async {
    try {
      Map<String, String> qparams = {'filter': 'popularity="Hotest"'};

      var respones = await _dio.get('collections/products/records',
          queryParameters: qparams);
      return respones.data['items']
          .map<Products>((jsonObject) => Products.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown erorr', 0);
    }
  }

  @override
  Future<List<Products>> getBestSeller() async {
    try {
      Map<String, String> qparams = {'filter': 'popularity="Best Seller"'};

      var respones = await _dio.get('collections/products/records',
          queryParameters: qparams);
      return respones.data['items']
          .map<Products>((jsonObject) => Products.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown erorr', 0);
    }
  }
}
