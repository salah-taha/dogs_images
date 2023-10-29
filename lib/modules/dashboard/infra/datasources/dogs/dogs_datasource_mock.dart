import 'package:dogs_images/modules/dashboard/infra/datasources/dogs/dogs_datasource.dart';
import 'package:dogs_images/modules/dashboard/infra/models/breed/breed_dto.dart';

class DogsDataSourceMock implements DogsDataSource {
  @override
  Future<List<BreedDto>> getBreedsList() {
    return Future.value([
      const BreedDto(
        name: 'affenpinscher',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'african',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'airedale',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'akita',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'appenzeller',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'australian',
        subBreeds: [BreedDto(name: 'shepherd', subBreeds: [])],
      ),
      const BreedDto(
        name: 'basenji',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'beagle',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'bluetick',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'borzoi',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'bouvier',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'boxer',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'brabancon',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'briard',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'buhund',
        subBreeds: [BreedDto(name: 'norwegian', subBreeds: [])],
      ),
      const BreedDto(
        name: 'bulldog',
        subBreeds: [
          BreedDto(name: 'boston', subBreeds: []),
          BreedDto(name: 'english', subBreeds: []),
          BreedDto(name: 'french', subBreeds: []),
        ],
      ),
      const BreedDto(
        name: 'bullterrier',
        subBreeds: [
          BreedDto(name: 'staffordshire', subBreeds: []),
        ],
      ),
      const BreedDto(
        name: 'cairn',
        subBreeds: [],
      ),
      const BreedDto(
        name: 'cattledog',
        subBreeds: [BreedDto(name: 'australian', subBreeds: [])],
      ),
    ]);
  }

  @override
  Future<List<String>> getImagesByBreed(String breedName) {
    return Future.value([
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10147.jpg',
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10185.jpg',
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10225.jpg',
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10439.jpg',
    ]);
  }

  @override
  Future<List<String>> getImagesBySubBreed(String breedName, String subBreedName) {
    return Future.value([
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10147.jpg',
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10185.jpg',
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10225.jpg',
      'https://images.dog.ceo/breeds/affenpinscher/n02110627_10439.jpg',
    ]);
  }

  @override
  Future<String> getRandomImageByBreed(String breedName) {
    return Future.value('https://images.dog.ceo/breeds/affenpinscher/n02110627_10147.jpg');
  }

  @override
  Future<String> getRandomImageBySubBreed(String breedName, String subBreedName) {
    return Future.value('https://images.dog.ceo/breeds/affenpinscher/n02110627_10147.jpg');
  }
}
