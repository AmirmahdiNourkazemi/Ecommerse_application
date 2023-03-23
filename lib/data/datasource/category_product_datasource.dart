import 'package:dio/dio.dart';
import 'package:mobile_shop/data/model/product.dart';

import '../../di/di.dart';
import '../../util/api_exeption.dart';

abstract class ICategoryDataSource {
  Future<List<Products>> getProductByCategory(String categoryId);
}

class CategoryProductRemoteDataSource extends ICategoryDataSource {
  @override
  Future<List<Products>> getProductByCategory(String categoryId) async {
    final Dio _dio = locator.get();
    try {
      Map<String, String> qparams = {'filter': 'category="$categoryId"'};
      Response<dynamic> response;

      if (categoryId == '78q8w901e6iipuk') {
        response = await _dio.get('collections/products/records');
      } else {
        response = await _dio.get('collections/products/records',
            queryParameters: qparams);
      }
      return response.data['items']
          .map<Products>((jsonObject) => Products.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
