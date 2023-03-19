import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/varient.dart';
import 'package:mobile_shop/data/model/varient_type.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';
import '../model/product_variant.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallary(String productId);
  Future<List<VarientType>> getVarientTypes(String productId);
  Future<List<Variant>> getvarients(String productId);
  Future<List<ProductVarient>> getProductVarient(String productId);
  Future<Category> getProductCategory(String categoryId);
}

class DetailProductRemoteDataSource extends IDetailProductDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImage>> getGallary(String productId) async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="$productId"'};

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
  Future<List<VarientType>> getVarientTypes(String productId) async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="$productId"'};

      var response = await _dio.get('collections/variants_type/records');
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
  Future<List<Variant>> getvarients(String productId) async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="$productId"'};

      var response = await _dio.get('collections/variants/records',queryParameters: qparams);
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
  Future<List<ProductVarient>> getProductVarient(String productId) async {
    var getType = await getVarientTypes(productId);
    var getList = await getvarients(productId);
    List<ProductVarient> productVarientList = [];
    try {
      for (var varientType in getType) {
        var variant = getList
            .where((element) => element.typeId == varientType.id)
            .toList();
        productVarientList.add(ProductVarient(varientType, variant));
      }
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }

    return productVarientList;
  }

  @override
  Future<Category> getProductCategory(String categoryId) async {
    try {
      Map<String, String> qparams = {'filter': 'id="$categoryId"'};
      var response = await _dio.get('collections/category/records',
          queryParameters: qparams);
      return Category.fromMapJson(response.data['items'][0]);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
