import 'package:dio/dio.dart';
import 'package:dogs_images/modules/dashboard/infra/datasources/dogs/dogs_datasource.dart';
import 'package:dogs_images/modules/dashboard/infra/models/breed/breed_dto.dart';
import 'package:dogs_images/modules/dashboard/infra/models/exception/data_exception.dart';

class DogsDataSourceImpl implements DogsDataSource {
  final Dio client;

  DogsDataSourceImpl() : client = Dio(BaseOptions(baseUrl: 'https://dog.ceo/api'));

  @override
  Future<List<BreedDto>> getBreedsList() async {
    try {
      final response = await client.get('/breeds/list/all');
      final breeds = response.data['message'] as Map<String, dynamic>;
      return breeds.entries.map((e) {
        return BreedDto(
          name: e.key,
          subBreeds: (e.value as List<dynamic>).map((e) {
            return BreedDto(
              name: e,
              subBreeds: [],
            );
          }).toList(),
        );
      }).toList();
    } on DioException catch (e) {
      throw DataException(e.message ?? 'Error while fetching breeds list');
    } catch (e) {
      throw DataException('Something went wrong');
    }
  }

  @override
  Future<List<String>> getImagesByBreed(String breedName) async {
    try {
      final response = await client.get('/breed/$breedName/images');
      final images = response.data['message'] as List<dynamic>;
      return images.map((e) => e as String).toList();
    } on DioException catch (e) {
      throw DataException(e.message ?? 'Error while fetching images by breed');
    } catch (e) {
      throw DataException('Something went wrong');
    }
  }

  @override
  Future<List<String>> getImagesBySubBreed(String breedName, String subBreedName) async {
    try {
      final response = await client.get('/breed/$breedName/$subBreedName/images');
      final images = response.data['message'] as List<dynamic>;
      return images.map((e) => e as String).toList();
    } on DioException catch (e) {
      throw DataException(e.message ?? 'Error while fetching images by sub breed');
    } catch (e) {
      throw DataException('Something went wrong');
    }
  }

  @override
  Future<String> getRandomImageByBreed(String breedName) async {
    try {
      final response = await client.get('/breed/$breedName/images/random');
      return response.data['message'] as String;
    } on DioException catch (e) {
      throw DataException(e.message ?? 'Error while fetching random image by breed');
    } catch (e) {
      throw DataException('Something went wrong');
    }
  }

  @override
  Future<String> getRandomImageBySubBreed(String breedName, String subBreedName) async {
    try {
      final response = await client.get('/breed/$breedName/$subBreedName/images/random');
      return response.data['message'] as String;
    } on DioException catch (e) {
      throw DataException(e.message ?? 'Error while fetching random image by sub breed');
    } catch (e) {
      throw DataException('Something went wrong');
    }
  }
}
