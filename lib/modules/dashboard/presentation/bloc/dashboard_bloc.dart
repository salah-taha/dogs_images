import 'package:dogs_images/modules/dashboard/domain/enums/dashboard_type.dart';
import 'package:dogs_images/modules/dashboard/domain/entities/breed_entity.dart';
import 'package:dogs_images/core/enums/resource_state.dart';
import 'package:dogs_images/modules/dashboard/infra/datasources/dogs/dogs_datasource.dart';
import 'package:dogs_images/modules/dashboard/infra/models/exception/data_exception.dart';
import 'package:dogs_images/modules/dashboard/presentation/validation/validation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._dogsRepository) : super(const DashboardState()) {
    on<DashboardInitialEvent>(_onInitialEvent);
    on<DashboardTypeChangedEvent>(_onTypeChangedEvent);
    on<DashboardBreedSelectedEvent>(_onBreedSelectedEvent);
    on<DashboardSubBreedSelectedEvent>(_onSubBreedSelectedEvent);
    on<DashboardRefreshEvent>(_onRefreshEvent);
  }

  final DogsDataSource _dogsRepository;

  void _onInitialEvent(
    DashboardInitialEvent event,
    Emitter<DashboardState> emit,
  ) async {
    _setLoading(emit);
    try {
      final breeds = await _getBreeds();
      emit(state.copyWith(
        breeds: breeds,
        resourceState: ResourceState.success,
      ));
      _validate(state);
    } on DataException catch (e) {
      _setError(emit, e.message);
    } on BaseValidationWarning catch (e) {
      _setError(emit, e.message);
    } catch (e) {
      _setError(emit, 'Unknown error');
    }
  }

  void _onTypeChangedEvent(
    DashboardTypeChangedEvent event,
    Emitter<DashboardState> emit,
  ) async {
    _setLoading(emit, type: event.dashboardType);
    try {
      final images = await _getImages();
      emit(state.copyWith(
        images: images,
        resourceState: ResourceState.success,
      ));
    } on DataException catch (e) {
      _setError(emit, e.message);
    } on BaseValidationWarning catch (e) {
      _setError(emit, e.message);
    } catch (e) {
      _setError(emit, 'Unknown error');
    }
  }

  void _onBreedSelectedEvent(
    DashboardBreedSelectedEvent event,
    Emitter<DashboardState> emit,
  ) async {
    _setLoading(emit, breed: event.breed, subBreed: BreedEntity.empty);
    try {
      final images = await _getImages();
      emit(state.copyWith(
        images: images,
        resourceState: ResourceState.success,
      ));
    } on DataException catch (e) {
      _setError(emit, e.message);
    } on BaseValidationWarning catch (e) {
      _setError(emit, e.message);
    } catch (e) {
      _setError(emit, 'Unknown error');
    }
  }

  void _onSubBreedSelectedEvent(
    DashboardSubBreedSelectedEvent event,
    Emitter<DashboardState> emit,
  ) async {
    _setLoading(emit, subBreed: event.subBreed);
    try {
      final images = await _getImages();
      emit(state.copyWith(
        images: images,
        resourceState: ResourceState.success,
      ));
    } on DataException catch (e) {
      _setError(emit, e.message);
    } on BaseValidationWarning catch (e) {
      _setError(emit, e.message);
    } catch (e) {
      _setError(emit, 'Unknown error');
    }
  }

  void _onRefreshEvent(
    DashboardRefreshEvent event,
    Emitter<DashboardState> emit,
  ) async {
    _setLoading(emit);
    try {
      final images = await _getImages();
      emit(state.copyWith(
        images: images,
        resourceState: ResourceState.success,
      ));
    } on DataException catch (e) {
      _setError(emit, e.message);
    } on BaseValidationWarning catch (e) {
      _setError(emit, e.message);
    } catch (e) {
      _setError(emit, 'Unknown error');
    }
  }

  Future<List<BreedEntity>> _getBreeds() async {
    final breeds = await _dogsRepository.getBreedsList();
    await Future.delayed(const Duration(seconds: 1));
    return breeds.map((e) => e.toEntity()).toList();
  }

  Future<List<String>> _getImages() async {
    _validate(state);
    switch (state.dashboardType) {
      case DashboardType.randomImageByBreed:
        return [await _dogsRepository.getRandomImageByBreed(state.selectedBreed.name)];
      case DashboardType.randomImageBySubBreed:
        return [await _dogsRepository.getRandomImageBySubBreed(state.selectedBreed.name, state.selectedSubBreed.name)];
      case DashboardType.imagesListByBreed:
        return await _dogsRepository.getImagesByBreed(state.selectedBreed.name);
      case DashboardType.imagesListBySubBreed:
        return await _dogsRepository.getImagesBySubBreed(state.selectedBreed.name, state.selectedSubBreed.name);
      default:
        return [];
    }
  }

  void _setLoading(Emitter<DashboardState> emit, {DashboardType? type, BreedEntity? breed, BreedEntity? subBreed}) {
    emit(state.copyWith(
      resourceState: ResourceState.loading,
      error: BaseValidationWarning.none,
      dashboardType: type,
      selectedBreed: breed,
      selectedSubBreed: subBreed,
    ));
  }

  void _setError(Emitter<DashboardState> emit, String message) {
    emit(state.copyWith(
      resourceState: ResourceState.error,
      error: BaseValidationWarning(message),
    ));
  }

  /// Validate dashboard state before request
  /// Throws [BaseValidationWarning] if state is invalid
  void _validate(DashboardState state) {
    switch (state.dashboardType) {
      case DashboardType.randomImageByBreed:
      case DashboardType.imagesListByBreed:
        if (state.selectedBreed == BreedEntity.empty) {
          throw const SelectBreedWarning();
        }
      case DashboardType.randomImageBySubBreed:
      case DashboardType.imagesListBySubBreed:
        if (state.selectedBreed == BreedEntity.empty) {
          throw const SelectBreedWarning();
        } else if (state.selectedBreed.subBreeds.isEmpty) {
          throw const NoSubBreedsWarning();
        } else if (state.selectedSubBreed == BreedEntity.empty) {
          throw const SelectSubBreedWarning();
        }
    }
  }
}
