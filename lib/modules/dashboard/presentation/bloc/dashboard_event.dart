part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {}

class DashboardTypeChangedEvent extends DashboardEvent {
  DashboardTypeChangedEvent(this.dashboardType);

  final DashboardType dashboardType;
}

class DashboardBreedSelectedEvent extends DashboardEvent {
  DashboardBreedSelectedEvent(this.breed);

  final BreedEntity breed;
}

class DashboardSubBreedSelectedEvent extends DashboardEvent {
  DashboardSubBreedSelectedEvent(this.subBreed);

  final BreedEntity subBreed;
}

class DashboardRefreshEvent extends DashboardEvent {}
