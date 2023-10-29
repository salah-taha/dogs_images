import 'package:dogs_images/modules/dashboard/infra/models/breed/breed_dto.dart';

abstract class DogsDataSource {
  /// Returns a list of all breeds from the API
  /// Throws a [DataException] if something goes wrong
  Future<List<BreedDto>> getBreedsList();

  /// Returns a list of breed images from the API
  /// Throws a [DataException] if something goes wrong
  Future<List<String>> getImagesByBreed(String breedName);

  /// Returns a random breed image from the API
  /// Throws a [DataException] if something goes wrong
  Future<String> getRandomImageByBreed(String breedName);

  /// Returns a list of sub breed images from the API
  /// Throws a [DataException] if something goes wrong
  Future<List<String>> getImagesBySubBreed(String breedName, String subBreedName);

  /// Returns a random sub breed image from the API
  /// Throws a [DataException] if something goes wrong
  Future<String> getRandomImageBySubBreed(String breedName, String subBreedName);
}
