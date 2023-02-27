import 'package:dio/dio.dart';
import 'package:mobile_shop/data/model/banner.dart';
import 'package:mobile_shop/di/di.dart';

import '../../util/api_exeption.dart';

abstract class IBannerDatasource {
  Future<List<BannerCampain>> getBanner();
}

class BannerRemoteDatasource extends IBannerDatasource {
  final Dio _dio = locator.get();
  Future<List<BannerCampain>> getBanner() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerCampain>(
              (jsonObject) => BannerCampain.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
