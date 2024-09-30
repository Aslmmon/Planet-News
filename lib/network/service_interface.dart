import 'package:chopper/chopper.dart';
import 'package:news_app/data/models/country/Country.dart';
import 'package:news_app/data/models/topics/Topics.dart';
import 'model_response.dart';

typedef CountryResponse = Response<Result<Country>>;

abstract class ServiceInterface {
  Future<List<Country>> getCountries();

  Future<List<Topics>> getTopics();

  Future<Response> fetchData(String api, String country, String category);
}
