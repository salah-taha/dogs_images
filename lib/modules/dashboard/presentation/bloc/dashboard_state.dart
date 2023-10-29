part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.resourceState = ResourceState.initial,
    this.dashboardType = DashboardType.randomImageByBreed,
    this.breeds = const [],
    this.selectedBreed = BreedEntity.empty,
    this.selectedSubBreed = BreedEntity.empty,
    this.images = const [],
    this.error = BaseValidationWarning.none,
  });

  final ResourceState resourceState;
  final DashboardType dashboardType;
  final List<BreedEntity> breeds;
  final BreedEntity selectedBreed;
  final BreedEntity selectedSubBreed;
  final List<String> images;
  final BaseValidationWarning error;

  DashboardState copyWith({
    DashboardType? dashboardType,
    List<BreedEntity>? breeds,
    ResourceState? resourceState,
    BreedEntity? selectedBreed,
    BreedEntity? selectedSubBreed,
    List<String>? images,
    BaseValidationWarning? error,
  }) {
    return DashboardState(
      dashboardType: dashboardType ?? this.dashboardType,
      breeds: breeds ?? this.breeds,
      resourceState: resourceState ?? this.resourceState,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      selectedSubBreed: selectedSubBreed ?? this.selectedSubBreed,
      images: images ?? this.images,
      error: error ?? this.error,
    );
  }

  bool get shouldShowSubBreedSelector => dashboardType.hasSubBreed;

  @override
  List<Object?> get props => [
        dashboardType,
        breeds,
        resourceState,
        selectedBreed,
        selectedSubBreed,
        images,
        error,
      ];
}
