import 'package:dogs_images/core/base/base_dto.dart';
import 'package:dogs_images/modules/dashboard/domain/entities/breed_entity.dart';

class BreedDto with BaseDto<BreedEntity, BreedDto> {
  final String name;
  final List<BreedDto> subBreeds;

  const BreedDto({
    required this.name,
    required this.subBreeds,
  });

  @override
  BreedEntity toEntity() {
    return BreedEntity(
      name: name,
      subBreeds: subBreeds.map((e) => e.toEntity()).toList(),
    );
  }
}
