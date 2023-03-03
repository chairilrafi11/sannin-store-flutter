import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanninstore/core/app/endpoint.dart';
import 'package:sanninstore/domain/models/response.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: '')
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET(Endpoint.categories)
  Future<ResponseAPI> categories();

  @GET(Endpoint.product)
  Future<ResponseAPI> products(
    @Query('kode') String kode
  );

}
