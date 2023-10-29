import 'package:dogs_images/core/base/base_entity.dart';
import 'package:dogs_images/modules/dashboard/infra/models/breed/breed_dto.dart';
import 'package:equatable/equatable.dart';

class BreedEntity extends Equatable with BaseEntity<BreedEntity, BreedDto> {
  final String name;
  final List<BreedEntity> subBreeds;

  const BreedEntity({
    required this.name,
    required this.subBreeds,
  });

  @override
  BreedDto toDto() {
    return BreedDto(
      name: name,
      subBreeds: subBreeds.map((e) => e.toDto()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        name,
        subBreeds,
      ];

  static const empty = BreedEntity(name: '', subBreeds: []);
}
