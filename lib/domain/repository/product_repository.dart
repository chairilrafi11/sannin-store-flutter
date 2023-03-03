import 'package:sanninstore/core/network/dio_service.dart';
import 'package:sanninstore/domain/models/categories.dart';

class ProductRepository {

  static Future<List<Categories>> categories() async {
    List<Categories> list = [];
    var response = await DioService.dioClient.categories();
    for (var element in response.data) {
      list.add(Categories.fromJson(element));
    }
    return list;
  }

}