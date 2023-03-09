import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/varient.dart';
import 'package:mobile_shop/data/model/varient_type.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';
import '../model/product_variant.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallary();
  Future<List<VarientType>> getVarientTypes();
  Future<List<Variant>> getvarients();
  Future<List<ProductVarient>> getProductVarient();
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

  @override
  Future<List<VarientType>> getVarientTypes() async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};

      var response = await _dio.get(
        'collections/variants_type/records',
      );
      return response.data['items']
          .map<VarientType>((jsonObject) => VarientType.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  Future<List<Variant>> getvarients() async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};

      var response = await _dio.get('collections/variants/records');
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  Future<List<ProductVarient>> getProductVarient() async {
    var getType = await getVarientTypes();
    var getList = await getvarients();
    List<ProductVarient> productVarientList = [];
    for (var varientType in getType) {
      var variant =
          getList.where((element) => element.typeId == varientType.id).toList();
      productVarientList.add(ProductVarient(varientType, variant));
    }
    return productVarientList;
  }
}

