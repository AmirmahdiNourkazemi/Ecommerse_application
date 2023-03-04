import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallary();
}

class DetailProductRemoteDataSource extends IDetailProductDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImage>> getGallary() async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};

      var response = await _dio.get('collections/gallery/records',
          queryParameters: qparams);
      return response.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
